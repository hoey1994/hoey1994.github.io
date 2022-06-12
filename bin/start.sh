#!/bin/bash

BIN_PATH=$(cd `dirname $0`; pwd)
#echo $BIN_PATH

PORT=$1
if [ ! -n "$PORT" ]; then
  PORT='8000'
fi
#echo $PORT

# goto root path
cd $BIN_PATH; cd ..

# kill pid
ps -ef | grep home_page_server.py | grep -v grep  | awk '{print $2}' | xargs kill -9

# run
nohup python home_page_server.py $PORT > /dev/null 2>&1 &
echo "[$PORT] RUN SUCCESS..."