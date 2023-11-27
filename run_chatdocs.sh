#!/bin/sh

C_NAME="keesj"
C_VERSION="chatdocs"
docker run -it --network none -v $(pwd):/workspace ${C_NAME}:${C_VERSION} /bin/bash
