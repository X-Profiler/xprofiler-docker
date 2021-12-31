#!/bin/bash

set -e

./mysql/startup.sh &

redis-server &

npm install -g pm2

while [ netstat -plnt |grep 3306|wc -l -eq 0 ]; do
  echo "Waiting for mysql to start..."
  sleep 1
done

while [ netstat -plnt |grep 6379|wc -l -eq 0 ]; do
  echo "Waiting for redis to start..."
  sleep 1
done

cd ./xprofiler-console 
npm start
cd ../xtransit-manager
npm start
cd ../xtransit-server
npm start
cd ..

nginx -g "daemon off;"