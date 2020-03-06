#!/bin/bash

CONTAINER_NAME="eit-device-mock"

curl https://raw.githubusercontent.com/NTNU-TIO4852-2020-Gr2/server-config/master/utils/device_mock.py -o device_mock.py

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker run -d -v $PWD/device_mock.py:/device_mock.py:ro --name $CONTAINER_NAME python:3 python3 /device_mock.py
