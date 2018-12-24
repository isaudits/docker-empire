#!/bin/bash

#docker pull debian:stable
docker build -t isaudits/empire .
docker image prune -f