"""
This file contains utility functions for configuring the IsiDataInsightsDaemon
via command line args and config file.
"""
import argparse
import configparser
import getpass
import logging
import os
import re
import sys
import urllib3

from ast import literal_eval

LOG = logging.getLogger(__name__)
DEFAULT_LOG_FILE = "./data_collectors.log"
DEFAULT_LOG_LEVEL = "INFO"

def _log_level_str_to_enum(log_level):
    if log_level.upper() == "DEBUG":
        return logging.DEBUG
    elif log_level.upper() == "INFO":
        return logging.INFO
    elif log_level.upper() == "WARNING":
        return logging.WARNING
    elif log_level.upper() == "ERROR":
        return logging.ERROR
    elif log_level.upper() == "CRITICAL":
        return logging.CRITICAL
    else:
        print("Invalid logging level: {}, setting to INFO.".format(log_level))
        return logging.INFO

def parse_cli():
    """
    Setup the command line args and parse them.
    """
    argparser = argparse.ArgumentParser(description='Starts Isilon Data Collector Process.')
    argparser._action_groups.pop()
    required = argparser.add_argument_group('Required arguments')
    optional = argparser.add_argument_group('Optional arguments')
    required.add_argument('--host', help="Specifies promotheus host ip or name")
    optional.add_argument('--path', help="Specifies directory to save output",  nargs='?', const='./', default='./')
    optional.add_argument('--metric', help="Specifies metric name")
    optional.add_argument('--start', help="Specifies query start time")
    optional.add_argument('--end', help="Specifies query end time")
    optional.add_argument('--time', help="Specifies query time")
    optional.add_argument('--query', help="Specifies query type")
    optional.add_argument('--time_range', help="Specifies time range in seconds")
    optional.add_argument('--func', help="Specifies fucntion to apply on metric")
    #optional.add_argument('--prometheus_user', help="Specifies Prometheus username")
    #optional.add_argument('--prometheus_passwd', help="Specifies prometheus user password")
    #optional.add_argument('--config', help="Specifies All configurations", nargs='?', const='config.json', default='config.json')
    #optional.add_argument('--isilon_ssl', help="Specifies whether SSL verification should be done on Isilon host. Default value is n ", nargs='?', const='n', default='n')
    #required.add_argument('--isilon_stats', help="Specifies Statistics to retrieve from Isilon host. valid values are {0}".format(STATS_NAME.keys()) )
    #required.add_argument('--influx_host', help="Specifies InfluxDB host ip. Default value is localhost.", nargs='?', const='localhost', default='localhost')
    #optional.add_argument('--influx_port', help="Specifies InfluxDB port. Default value is 8086.", nargs='?', const='8086', default='8086')
    #required.add_argument('--influx_db', help="Specifies InfluxDB database to use. If it does no exsist, it will be created.")
    #optional.add_argument('--influx_user', help="Set the path to the daemon pid file. The default value is root.")
    #optional.add_argument('--influx_passwd', help="Set the path to the daemon pid file. The default value is root.")

    optional.add_argument('--log_file', help="Set the path to the log file. The default value is %s" % DEFAULT_LOG_FILE, nargs='?', const=DEFAULT_LOG_FILE, default=DEFAULT_LOG_FILE)
    optional.add_argument('--log_level', help="Set the log level. The default value is INFO", nargs='?', const='INFO', default=DEFAULT_LOG_LEVEL)

    return argparser.parse_args()

def configure_process(daemon, args):
    """
    Configure the daemon's stat groups and the stats processor via command line
    arguments.
    """
    daemon.set_host(args.host)
    daemon.set_path(args.path)
    #_configure_prometheus_client(daemon, args)
    #_configure_metric_names(daemon, args)
    #_print_stat_groups(daemon)

def _configure_prometheus_client(daemon, args):
    """
    Configure the daemon's stat prometheus client
    """
    params = {}
    params['start_time'] = args.start
    params['end_time'] = args.end
    params['time'] = args.time
    params['time_range'] = args.time_range
    params['function'] = args.func
    daemon.set_host(args.host)
    daemon.set_query(args.query)
    daemon.set_metric(args.metric)
    demon.set_parameters(params)
    LOG.info("Collecting data from Prometheus Host %s " % args.host)

def _configure_metric_names(daemon, args):
    """
    Configure the daemon's stat name
    """
    if args.metric is None:
        print >> sys.stderr, "You must provide metric to query via the --metric command line argument."
        sys.exit(1)
    daemon.set_metric_name(args.metric)

def configure_logging_via_cli(args):
    """
    Setup the logging from command line args.
    """
    if args.log_file is None:
        args.log_file = DEFAULT_LOG_FILE

    parent_dir = os.path.dirname(args.log_file)
    if parent_dir and os.path.exists(parent_dir) is False:
        print("Invalid log file path: {}.".format(args.log_file))
        sys.exit(1)

    if args.log_level is None:
        args.log_level = DEFAULT_LOG_LEVEL

    log_level = _log_level_str_to_enum(args.log_level)
    logging.basicConfig(filename=args.log_file, level=log_level, format='%(asctime)s:%(name)s:%(levelname)s: %(message)s')
    console = logging.StreamHandler()
    console.setLevel(logging.DEBUG)
    # set a format which is simpler for console use
    formatter = logging.Formatter('%(asctime)s:%(name)s:%(levelname)s: %(message)s')
    console.setFormatter(formatter)
    # add the handler to the root logger
    logging.getLogger('').addHandler(console)
    LOG.info("Logging Data collectors in file %s" % args.log_file)

def read_config(options):
    """
    reading configuration file
    """
    configuration = dict()
