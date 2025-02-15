#!/bin/bash

docker build -t isaudits/empire .
docker image prune -f