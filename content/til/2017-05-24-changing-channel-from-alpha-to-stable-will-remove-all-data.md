+++
date = "2017-05-24T00:00:01"
title = "#TIL : Changing channel from alpha to stable will remove ALL DATA"
description = "I learned on 2017-05-24 about sysadmin, docker"
categories = ["Today I learned", "docker"]
tags = ["sysadmin", "docker"]
+++



## Changing channel from alpha to stable will remove ALL DATA

On MacOS, changing Docker channel will remove all data (includes volumes, images, networks and ... everything).

Because Docker on Mac using a minimal Linux machine to host docker engine, so changing machine means discarding all old data. So BECAREFUL !
