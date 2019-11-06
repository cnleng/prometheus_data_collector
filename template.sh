#!/bin/bash
file_path=$1
start_time=$2
end_time=$3
time_range=$4

echo 'Collecting CPU Usage.'
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric node_cpu_seconds_total --host "http://localhost:9090/api/v1/query_range?query=(sum(irate(node_cpu_seconds_total{mode!=\"idle\"}[$time_range]))without(cpu))/count(node_cpu_seconds_total)without(cpu)&start=$start_time.000Z&end=$end_time.000Z&step=30s"

echo 'Collecting Network Traffic.'
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric node_network_transmit_bytes_total --host "http://localhost:9090/api/v1/query_range?query=rate(node_network_transmit_bytes_total{device=\"ib0\"}[$time_range])&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric node_network_receive_bytes_total --host "http://localhost:9090/api/v1/query_range?query=rate(node_network_receive_bytes_total{device=\"ib0\"}[$time_range])&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric node_network_transmit_packets_total --host "http://localhost:9090/api/v1/query_range?query=rate(node_network_transmit_packets_total{device=\"ib0\"}[$time_range])&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric node_network_receive_packets_total --host "http://localhost:9090/api/v1/query_range?query=rate(node_network_receive_packets_total{device=\"ib0\"}[$time_range])&start=$start_time.000Z&end=$end_time.000Z&step=30s"

echo 'Collecting GPU Usage'
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric nvidia_utilization_gpu0 --host "http://localhost:9090/api/v1/query_range?query=nvidia_utilization_gpu{gpu=\"0\"}&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric avg_nvidia_utilization_gpu0 --host "http://localhost:9090/api/v1/query?query=avg_over_time(nvidia_utilization_gpu{gpu=\"0\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric min_nvidia_utilization_gpu0 --host "http://localhost:9090/api/v1/query?query=min_over_time(nvidia_utilization_gpu{gpu=\"0\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric max_nvidia_utilization_gpu0 --host "http://localhost:9090/api/v1/query?query=max_over_time(nvidia_utilization_gpu{gpu=\"0\"}[$time_range])&time=$end_time.000Z"

python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric nvidia_utilization_gpu1 --host "http://localhost:9090/api/v1/query_range?query=nvidia_utilization_gpu{gpu=\"1\"}&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric avg_nvidia_utilization_gpu1 --host "http://localhost:9090/api/v1/query?query=avg_over_time(nvidia_utilization_gpu{gpu=\"1\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric min_nvidia_utilization_gpu1 --host "http://localhost:9090/api/v1/query?query=min_over_time(nvidia_utilization_gpu{gpu=\"1\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric max_nvidia_utilization_gpu1 --host "http://localhost:9090/api/v1/query?query=max_over_time(nvidia_utilization_gpu{gpu=\"1\"}[$time_range])&time=$end_time.000Z"

python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric nvidia_utilization_gpu2 --host "http://localhost:9090/api/v1/query_range?query=nvidia_utilization_gpu{gpu=\"2\"}&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric avg_nvidia_utilization_gpu2 --host "http://localhost:9090/api/v1/query?query=avg_over_time(nvidia_utilization_gpu{gpu=\"2\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric min_nvidia_utilization_gpu2 --host "http://localhost:9090/api/v1/query?query=min_over_time(nvidia_utilization_gpu{gpu=\"2\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric max_nvidia_utilization_gpu2 --host "http://localhost:9090/api/v1/query?query=max_over_time(nvidia_utilization_gpu{gpu=\"2\"}[$time_range])&time=$end_time.000Z"

python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric nvidia_utilization_gpu3 --host "http://localhost:9090/api/v1/query_range?query=nvidia_utilization_gpu{gpu=\"3\"}&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric avg_nvidia_utilization_gpu3 --host "http://localhost:9090/api/v1/query?query=avg_over_time(nvidia_utilization_gpu{gpu=\"3\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric min_nvidia_utilization_gpu3 --host "http://localhost:9090/api/v1/query?query=min_over_time(nvidia_utilization_gpu{gpu=\"3\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric max_nvidia_utilization_gpu3 --host "http://localhost:9090/api/v1/query?query=max_over_time(nvidia_utilization_gpu{gpu=\"3\"}[$time_range])&time=$end_time.000Z"

echo 'Collecting GPU Memory Usage.'
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric nvidia_utilization_memory0 --host "http://localhost:9090/api/v1/query_range?query=nvidia_utilization_memory{gpu=\"0\"}&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric avg_nvidia_utilization_memory0  --host "http://localhost:9090/api/v1/query?query=avg_over_time(nvidia_utilization_memory{gpu=\"0\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric min_nvidia_utilization_memory0 --host "http://localhost:9090/api/v1/query?query=min_over_time(nvidia_utilization_memory{gpu=\"0\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric max_nvidia_utilization_memory0 --host "http://localhost:9090/api/v1/query?query=max_over_time(nvidia_utilization_memory{gpu=\"0\"}[$time_range])&time=$end_time.000Z"

python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric nvidia_utilization_memory1 --host "http://localhost:9090/api/v1/query_range?query=nvidia_utilization_memory{gpu=\"1\"}&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric avg_nvidia_utilization_memory1 --host "http://localhost:9090/api/v1/query?query=avg_over_time(nvidia_utilization_memory{gpu=\"1\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric min_nvidia_utilization_memory1 --host "http://localhost:9090/api/v1/query?query=min_over_time(nvidia_utilization_memory{gpu=\"1\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric max_nvidia_utilization_memory1 --host "http://localhost:9090/api/v1/query?query=max_over_time(nvidia_utilization_memory{gpu=\"1\"}[$time_range])&time=$end_time.000Z"

python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric nvidia_utilization_memory2 --host "http://localhost:9090/api/v1/query_range?query=nvidia_utilization_memory{gpu=\"2\"}&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric avg_nvidia_utilization_memory2 --host "http://localhost:9090/api/v1/query?query=avg_over_time(nvidia_utilization_memory{gpu=\"2\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric min_nvidia_utilization_memory2 --host "http://localhost:9090/api/v1/query?query=min_over_time(nvidia_utilization_memory{gpu=\"2\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric max_nvidia_utilization_memory2 --host "http://localhost:9090/api/v1/query?query=max_over_time(nvidia_utilization_memory{gpu=\"2\"}[$time_range])&time=$end_time.000Z"

python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric nvidia_utilization_memory3 --host "http://localhost:9090/api/v1/query_range?query=nvidia_utilization_memory{gpu=\"3\"}&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric avg_nvidia_utilization_memory3 --host "http://localhost:9090/api/v1/query?query=avg_over_time(nvidia_utilization_memory{gpu=\"3\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric min_nvidia_utilization_memory3 --host "http://localhost:9090/api/v1/query?query=min_over_time(nvidia_utilization_memory{gpu=\"3\"}[$time_range])&time=$end_time.000Z"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric max_nvidia_utilization_memory3 --host "http://localhost:9090/api/v1/query?query=max_over_time(nvidia_utilization_memory{gpu=\"3\"}[$time_range])&time=$end_time.000Z"

echo 'Collecting Disk Usage'
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric disk_usage_dev_sda1 --host "http://localhost:9090/api/v1/query_range?query=((node_filesystem_avail_bytes{device=\"/dev/sda1\"}/node_filesystem_size_bytes{device=\"/dev/sda1\"})*100)&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric disk_usage_home1 --host "http://localhost:9090/api/v1/query_range?query=((node_filesystem_avail_bytes{device=\"10.10.10.200:/mnt/xfs1/home\"}/node_filesystem_size_bytes{device=\"10.10.10.200:/mnt/xfs1/home\"})*100)&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric disk_usage_lustre --host "http://localhost:9090/api/v1/query_range?query=((node_filesystem_avail_bytes{device=\"10.10.12.2@o2ib:10.10.12.1@o2ib:/lustrefs\"}/node_filesystem_size_bytes{device=\"10.10.12.2@o2ib:10.10.12.1@o2ib:/lustrefs\"})*100)&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric disk_usage_cm_shared --host "http://localhost:9090/api/v1/query_range?query=((node_filesystem_avail_bytes{device=\"master:/cm/shared\"}/node_filesystem_size_bytes{device=\"master:/cm/shared\"})*100)&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric disk_usage_rootfs --host "http://localhost:9090/api/v1/query_range?query=((node_filesystem_avail_bytes{device=\"rootfs\"}/node_filesystem_size_bytes{device=\"rootfs\"})*100)&start=$start_time.000Z&end=$end_time.000Z&step=30s"
python isi_data_collectors.py --path "/tmp/tf_output/$file_path/" --metric disk_usage_tmpfs --host "http://localhost:9090/api/v1/query_range?query=((node_filesystem_avail_bytes{device=\"tmpfs\"}/node_filesystem_size_bytes{device=\"tmpfs\"})*100)&start=$start_time.000Z&end=$end_time.000Z&step=30s"

echo 'Done.'
