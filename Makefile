
SHELL:=/bin/bash

WORKDIR_PATH=/raftstereo
REPO_PATH:=$(dir $(abspath $(firstword $(MAKEFILE_LIST))))
IMAGE_TAG?=pvphan/raftstereo:0.1

ifneq ($(shell lshw -C display 2> /dev/null | grep NVIDIA | wc -l), 0)
	GPU_FLAG:=--gpus=all
endif

RUN_FLAGS = \
	--rm -it \
	${GPU_FLAG} \
	--ipc=host \
	--user="$(id -u):$(id -g)" \
	--volume=${REPO_PATH}:${WORKDIR_PATH} \
	${IMAGE_TAG}

shell: image
	docker run ${RUN_FLAGS} bash

image:
	docker build --tag ${IMAGE_TAG} .
