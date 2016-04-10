#!/bin/bash

INPUT_DIR=/user/renchangyan/input
OUTPUT_DIR=/user/renchangyan/output
#rmr output directory
"$HADOOP_HOME/bin/hadoop" fs -test -d $OUTPUT_DIR
[[ $? -eq 0 ]] && "$HADOOP_HOME/bin/hadoop" fs -rm -r $OUTPUT_DIR
#run job
"$HADOOP_HOME/bin/hadoop" jar "$HADOOP_HOME"/share/hadoop/tools/lib/hadoop-streaming-*.jar \
    -D mapred.job.name='WordCount-example' \
    -files hdfs://master1:9000/user/renchangyan/mr/files/white.txt#white.list \
    -file map.py      \
    -mapper   map.py  \
    -file reduce.py   \
    -reducer  reduce.py \
    -input $INPUT_DIR \
    -output $OUTPUT_DIR 
