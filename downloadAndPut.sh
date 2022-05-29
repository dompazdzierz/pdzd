#!/bin/sh
mkdir /data/importData/tmp

cd /data/importData/tmp

htmlTrade=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=15TEE1VBNY1gBW5fuzjBIhqfhI6pRfOFt"`
curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${htmlTrade}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=15TEE1VBNY1gBW5fuzjBIhqfhI6pRfOFt" -o trade_data.zip

html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=19Ew-bev32s3JTBhnI8qbejbFQGcPRRfi"`
curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=19Ew-bev32s3JTBhnI8qbejbFQGcPRRfi" -o indicators.zip

curl -L "https://drive.google.com/uc?export=download&id=1foibqwpfg4JANwyg_hoB5Qh23aku813A" -o country-codes.csv
curl -L "https://drive.google.com/uc?export=download&id=1rbVDq_AGvXuoSiiPfiHxGsT7MoJWyc6z" -o regions.csv

unzip indicators.zip
unzip trade_data.zip

hdfs dfs -mkdir -p /tmp/hadoop/

hdfs dfs -put -f trade_data.csv /tmp/hadoop/

hdfs dfs -put -f Indicators.csv /tmp/hadoop/
hdfs dfs -put -f country-codes.csv /tmp/hadoop/
hdfs dfs -put -f regions.csv /tmp/hadoop/

rm -rf /data/importData/tmp