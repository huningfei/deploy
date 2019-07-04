# coding:utf-8

from kafka import KafkaConsumer



host = '192.168.2.10'
port = '9092'
topic = 'ty_log_user_analysis_test3'

consumer = KafkaConsumer(topic, bootstrap_servers=host + ':' + port, auto_offset_reset='earliest')

num = 0;
offset = None


for msg in consumer:
    offset = msg.offset
    num += 1

    print('num：' + str(num) + ' offset: ' + str(offset))






# coding:utf-8

# from kafka import KafkaConsumer
#
#
#
# host = '192.168.2.228'
# port = '9092'
# topic = 'ty_log_user_analysis_test3'
#
# consumer = KafkaConsumer(topic, bootstrap_servers=host + ':' + port, auto_offset_reset='earliest')
#
# num = 0;
# offset = None
#
#
# for msg in consumer:
#     offset = msg.offset
#     num += 1
#     print(msg)
#     #print('num：' + str(num) + ' offset: ' + str(offset))
