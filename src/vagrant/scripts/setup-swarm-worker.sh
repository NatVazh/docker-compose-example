#!/bin/bash

set -e

if [ -f "/home/vagrant/worker_token.txt" ]; then
    if ! docker node ls &>/dev/null; then
        docker swarm join --token $(cat /home/vagrant/worker_token.txt) 192.168.56.10:2377
    fi
fi
