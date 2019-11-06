#! /bin/bash
docker run -it -v /home/$(id -un):/home/$(id -un) --hostname kdocker kernel-builder
