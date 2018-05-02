+++
date = "2017-11-22T23:59:59"
title = "#TIL : Reduce init time MySQL docker image"
description = "I learned in 2017-11-22 about docker, ci, devops"
categories = ["Today I learned", "docker"]
tags = ["docker", "ci", "devops"]
+++



## Reduce init time MySQL docker image

Original MySQL docker image uses a script to generate ssl certificates for service. Sometime we don't really need it (connect via a docker network link or need a fast enough database service to build a automated test).

We can reduce init time by removing the script from original Docker image

```
FROM mysql:5.7

# Remove mysql_ssl_rsa_setup to ignore setup SSL certs
RUN rm -f /usr/bin/mysql_ssl_rsa_setup
```

> FAST as a FEATURE !!! 🚀
