+++
date = "2015-12-30T23:59:59"
title = "#TIL 2015-12-30 : Commands"
description = "I learned in 2015-12-30 about sysadmin, command-line, bash"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "command-line", "bash"]
+++



## Commands

### Command `lsof`

List all opened files, sockets, pipes

Eg: 

- List processes are using port 80 (need root if port between 1-1023)

```bash
# sudo lsof -i:80
```

- List processes are using /bin/bash

```bash
# lsof /bin/bash
```
