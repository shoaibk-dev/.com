+++
date = "2017-05-24T23:59:59"
title = "#TIL : Reducing docker image the right way"
description = "I learned on 2017-05-24 about sysadmin, docker"
categories = ["Today I learned", "docker"]
tags = ["sysadmin", "docker"]
+++



## Reducing docker image the right way

When building an image, Docker engine commit file system layer on every command (RUN, ADD, COPY). So next time you installing packages from package manager likes apt, yum, pacman, ...remember clean their cache in same line.

**BAD WAY**

```
RUN apt-get update
RUN apt-get install git

# Something here

# End of file
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
```

**RIGHT WAY**

```
RUN apt-get update && apt-get install -y git zip unzip && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
```
