echo 'Collecting AlexNet 1Node-1GPU'
#./template.sh alx_1_1_128 '2019-11-03T23:23:22' '2019-11-03T23:29:33' 371s
#./template.sh alx_1_1_64 '2019-11-03T23:53:24' '2019-11-04T00:00:19' 415s
#./template.sh alx_1_1_32 '2019-11-04T00:02:19' '2019-11-04T00:11:21' 542s

echo 'Collecting AlexNet 1Node-4GPU'
#./template.sh alx_1_4_128 '2019-11-04T15:52:21' '2019-11-04T15:55:22' 181s
#./template.sh alx_1_4_64 '2019-11-04T16:11:39' '2019-11-04T16:14:27' 168s
#./template.sh alx_1_4_32 '2019-11-04T16:16:27' '2019-11-04T16:20:43' 256s

echo 'Collecting GoogleNet 1Node-1GPU'
#./template.sh goo_1_1_128 '2019-11-04T00:21:32' '2019-11-04T00:44:45' 1393s
#./template.sh goo_1_1_64 '2019-11-04T01:10:46' '2019-11-04T01:36:07' 1521s
#./template.sh goo_1_1_32 '2019-11-04T01:38:07' '2019-11-04T02:07:12' 1745s

echo 'Collecting GoogleNet 1Node-4GPU'
#./template.sh goo_1_4_128 '2019-11-04T02:07:12' '2019-11-04T02:14:14' 422s
#./template.sh goo_1_4_64 '2019-11-04T02:24:49' '2019-11-04T02:32:39' 470s
#./template.sh goo_1_4_32 '2019-11-04T02:34:39' '2019-11-04T02:44:01' 582s

echo 'Collecting ResNet 1Node-1GPU'
#./template.sh res_1_1_128 '2019-11-04T02:44:01' '2019-11-04T03:44:21' 3620s
#./template.sh res_1_1_64 '2019-11-04T03:46:21' '2019-11-04T04:49:39' 3798s
#./template.sh res_1_1_32 '2019-11-04T04:51:39' '2019-11-04T06:02:06' 4227s

echo 'Collecting ResNet 1Node-4GPU'
#./template.sh res_1_4_128 '2019-11-04T06:02:06' '2019-11-04T06:18:29' 983s
#./template.sh res_1_4_64 '2019-11-04T06:19:29' '2019-11-04T06:36:35' 1026s
#./template.sh res_1_4_32 '2019-11-04T06:37:35' '2019-11-04T06:56:20' 1125s

echo 'Collecting AlexNet 4Node-4GPU'
#./template.sh alx_4_4_128 '2019-11-03T20:51:55' '2019-11-03T20:54:26' 151s
#./template.sh alx_4_4_64 '2019-11-03T21:02:46' '2019-11-03T21:06:22' 216s
#./template.sh alx_4_4_43 '2019-11-03T21:07:22' '2019-11-03T21:15:12' 470s

echo 'Collecting AlexNet 4Node-1GPU'
#./template.sh alx_4_1_128 '2019-11-03T20:02:15' '2019-11-03T20:08:15' 360s
#./template.sh alx_4_1_64 '2019-11-03T20:19:02' '2019-11-03T20:29:39' 637s
#./template.sh alx_4_1_32 '2019-11-03T20:30:39' '2019-11-03T20:50:55' 1216s

echo 'Collecting GoogleNet 4Node-1GPU'
#./template.sh goo_4_1_128 '2019-11-03T21:16:12' '2019-11-03T21:22:38' 386s
#./template.sh goo_4_1_64 '2019-11-03T21:30:34' '2019-11-03T21:37:50' 436s
#./template.sh goo_4_1_32 '2019-11-03T21:38:50' '2019-11-03T21:47:41' 531s

echo 'Collecting GoogleNet 4Node-4GPU'
./template.sh goo_4_4_128 '2019-11-03T21:48:41' '2019-11-03T21:50:58' 137s
./template.sh goo_4_4_64 '2019-11-03T21:54:55' '2019-11-03T21:57:22' 147s
./template.sh goo_4_4_32 '2019-11-03T21:58:22' '2019-11-03T22:01:20' 178s

echo 'Collecting ResNet 4Node-1GPU'
./template.sh res_4_1_128 '2019-11-03T22:02:20' '2019-11-03T22:18:12' 952s
./template.sh res_4_1_64 '2019-11-03T22:19:12' '2019-11-03T22:36:39' 1047s
./template.sh res_4_1_32 '2019-11-03T22:37:39' '2019-11-03T22:57:56' 1217s

echo 'Collecting ResNet 4Node-4GPU'
./template.sh res_4_4_128 '2019-11-03T22:58:56' '2019-11-03T23:03:27' 271s
./template.sh res_4_4_64 '2019-11-03T23:04:27' '2019-11-03T23:09:17' 290s
./template.sh res_4_4_32 '2019-11-03T23:10:17' '2019-11-03T23:16:21' 364s

