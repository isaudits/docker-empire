#!/bin/bash

#docker pull debian:stable
docker build -t empire .
docker image prune -f