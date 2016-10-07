#!/bin/bash

docker build --no-cache --pull -t node-alpine-base-test ..
docker build --no-cache -t uut .
docker run --rm uut
