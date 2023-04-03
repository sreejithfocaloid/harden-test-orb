#!/bin/bash
IMAGE="sreejithfocaloid/node-example:latest.instrumented"
docker pull $IMAGE

eval "docker run -d --cap-add ALL --user root --name my-orb-project -p 9001:9001 $IMAGE"