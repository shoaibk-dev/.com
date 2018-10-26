+++
date = "2017-09-26T23:59:59"
title = "#TIL : BASH exiting on first error"
description = "I learned on 2017-09-26 about sysadmin, shell, bash"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "shell", "bash"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## BASH exiting on first error

Setting a flag `set -e` to bash script will let the script exit on first error occurs, so if you want to ignore a command just adding ` || true` to suffix

```bash
set -e

errorCmd $1 || true
echo "Run here !"
```

And opposite of `set -e` is `set +e`, haha of course !

```bash
set +e

errorCmd $1
echo "Still run here !"
```
