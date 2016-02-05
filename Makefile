ROOT_PATH := $(shell pwd)
IMAGE_NAME := "azukiapp/erlang"

# bins
DOCKER := $(shell which adocker || which docker)

all: build test

build:
	${DOCKER} build -t ${IMAGE_NAME}:latest     5
	${DOCKER} build -t ${IMAGE_NAME}:4          4
	${DOCKER} build -t ${IMAGE_NAME}:0.11       0.11
	${DOCKER} build -t ${IMAGE_NAME}:0.12       0.12
	${DOCKER} build -t ${IMAGE_NAME}:0.10       0.10

build-no-cache:
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:latest     5
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:4          4
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:0.11       0.11
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:0.12       0.12
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:0.10       0.10

test:
	${DOCKER} run -it -v `pwd`:/tmp ${IMAGE_NAME}:latest   bash /tmp/run-app-test.sh
	${DOCKER} run -it -v `pwd`:/tmp ${IMAGE_NAME}:4        bash /tmp/run-app-test.sh
	${DOCKER} run -it -v `pwd`:/tmp ${IMAGE_NAME}:0.11     bash /tmp/run-app-test.sh
	${DOCKER} run -it -v `pwd`:/tmp ${IMAGE_NAME}:0.12     bash /tmp/run-app-test.sh
	${DOCKER} run -it -v `pwd`:/tmp ${IMAGE_NAME}:0.10     bash /tmp/run-app-test.sh

.PHONY: all build build-no-cache test
