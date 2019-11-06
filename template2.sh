#!/bin/bash
file_path=$1
start_time=$2
end_time=$3
time_range=$4


echo 'Collecting Total Received Network Traffic.'
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric total_received_network --host "http://localhost:9090/api/v1/query?query=sum(sum_over_time(node_network_receive_bytes_total{device=\"ib0\"}[$time_range]))&time=$end_time.000Z"

echo 'Collecting Total Transmitted Network Traffic.'
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric total_transmitted_network --host "http://localhost:9090/api/v1/query?query=sum(sum_over_time(node_network_transmit_bytes_total{device=\"ib0\"}[$time_range]))&time=$end_time.000Z"

echo 'Done.'
