#!/usr/bin/env python

import sys

from data_collectors_config import parse_cli, configure_logging_via_cli, configure_process
from data_collectors_process import DataCollectorsProcess


def main():
    args = parse_cli()
    # validate the pid_file arg and get the full path to it.
    collector = DataCollectorsProcess()

    if args.host is None:
        print >> sys.stderr, "Invalid arguments, Check usage : python data_collectors.py -h"
        sys.exit(1)
    else:
        configure_logging_via_cli(args)
        configure_process(collector, args)
        collector.collect()

if __name__ == "__main__":
    main()
