+++
date = "2018-12-03T23:59:59"
title = "#TIL : SSH to docker host in Docker for Mac"
description = "I learned on 2018-12-03 about docker, mac"
categories = ["Today I learned", "docker"]
tags = ["docker", "mac"]
+++



## SSH to docker host in Docker for Mac

When you need to debug the docker host of your docker server inside macOS. You can connect to its tty screen by


```bash
$ screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
```

Then type `ENTER` to enter the screen and start debugging docker host.

To disconnect the screen, press "Ctrl + A > Ctrl + \" and confirm "yes".
