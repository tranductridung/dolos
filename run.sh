#!/bin/bash
sudo docker build -t agent .
sudo apparmor_parser -r -W docker-network
sudo docker run --cap-add=NET_ADMIN --net=host --privileged --rm -it -p 4444:4444 -p 4445:4445 --security-opt apparmor=docker-network --name agent agent
