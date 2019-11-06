from ast import literal_eval
import os
import logging
import time
import urllib3.exceptions
import csv
import requests
import sys
import datetime

LOG = logging.getLogger(__name__)

class DataCollectorsProcess():
    """
    Periodically query a list of prometheus instance for statistics and
    process them via a configurable stats processor module.
    """
    def __init__(self):
        """
        Initialize.
        """
        self._query = None
        self._host = None
        self._metric = None
        self._parameters = None
        self._path = None
        
    def _get_url(self, host, query, metric, parameters):
        """
        Build http request url
        """
        url = None
        time_range = parameters['time_range']
        function = parameters['function']
        if query == 'query':
           time = parameters['time']
           url = '{}/api/v1/{}?query={}({}[{}s])&time={}'.format(host, query, function, metric, time_range, time)
        else:
           start_time = parameters['start_time']
           end_time = parameters['end_time']
           url = '{}/api/v1/{}?query={}({}[{}s])&start={}&end={}&step={}s'.format(host, query, function, metric, time_range, start_time, end_time, time_range)
        return url

    def _export_csv(self, data):
        """
        Export data to csv file
        """
        results = data['result']
        # Build a list of all labelnames used.
        # gets all keys and discard __name__
        for result in results:
            now = datetime.datetime.now()
            date_time = "{}".format(now.strftime("%m-%d-%Y-%H:%M:%S"))
            if 'instance' in result['metric']:
                csv_file_name = "{}{}-{}-{}.csv".format(self._path, self._metric, result['metric']['instance'], date_time) 
            else:
               csv_file_name = "{}{}-{}.csv".format(self._path, self._metric, date_time)
            values = []
            if 'values' in result:
                 values = result['values']
            if 'value' in result:
                 values.append(result['value'])
                 
            header = ['Timestamp','Value']
            os.makedirs(os.path.dirname(csv_file_name), exist_ok=True)
            with open(csv_file_name, 'w', newline='') as csv_file:
                 csv_writer = csv.writer(csv_file)
                 csv_writer.writerow(header)
                 for value in values:
                    csv_writer.writerow(value)
       
        

    def start(self):
        """
        Start collecting data
        """
        url = self._get_url(self._host, self._query, self._metric, self._parameters)
        data = response.json()['data']
        self._export_csv(data)
   
    def collect(self):
        """
        Start Collecting data (simple)
        """ 
        response = requests.request(method='GET', url=self._host)
        data = response.json()['data']
        self._export_csv(data)
        

    def set_host(self, host):
        """
        Set host url
        """
        self._host = host

    def set_query(self, query):
        self._query = query

    def set_parameters(self, parameters):
        self._parameters = parameters

    def set_metric(self, metric):
        """
        Set metric name to collect
        """
        self._metric = metric

    def set_path(self, path):
        """
        Set path to save output
        """
        self._path = path
