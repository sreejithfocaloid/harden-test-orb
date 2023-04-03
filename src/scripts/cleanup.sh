#!/bin/bash
PROJECT_CONTAINER_NAME="my-orb-project"
docker stop "$PROJECT_CONTAINER_NAME"
docker logs "$PROJECT_CONTAINER_NAME" 
docker wait "$PROJECT_CONTAINER_NAME"
docker rm --force "$PROJECT_CONTAINER_NAME"
