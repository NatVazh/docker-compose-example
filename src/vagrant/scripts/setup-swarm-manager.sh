#!/bin/bash

set -e

# Init Swarm
docker swarm init --advertise-addr 192.168.56.10

# Save node's token
docker swarm join-token -q worker > /home/vagrant/worker_token.txt

# Create overlay network
docker network create --driver overlay --attachable app-network

echo "Менеджер настроен. IP: 192.168.56.10"
