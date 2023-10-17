BUILD_DEFINITION_FILE:=cpp.def
IMAGE_FILE:=cpp.sif
CONTAINER_NAME:=cpp

SINGULARITY_CACHEDIR=$(pwd)/build

all: build start

build: $(BUILD_DEFINITION_FILE)
	singularity build --fakeroot $(IMAGE_FILE) $(BUILD_DEFINITION_FILE)

start: $(IMAGE_FILE)
	singularity instance start $(IMAGE_FILE) $(CONTAINER_NAME)

stop: $(shell singularity instance list $(CONTAINER_NAME))
	singularity instance stop $(CONTAINER_NAME)

clean:
	rm -f ${IMAGE_FILE}
