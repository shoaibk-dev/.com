+++
date = "2018-03-01T23:59:59"
title = "#TIL 2018-03-01 : Prevent source hacking from .git directory exposing"
description = "I learned in 2018-03-01 about sysadmin, security, hacking"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "security", "hacking"]
+++



## Prevent source hacking from .git directory exposing

Many web project use Git as source version control tools. So in production
server, we could expose the hidden `.git` directory - which contains all most
infomation about project source code.

To "rip" a source code from a vulnerable website, we can use this tool : https://github.com/kost/dvcs-ripper#git

So to prevent this happens, try to deny all http access to hidden files and
directories (usually starts by `.` character)

Example of Nginx config

```
location ~ /\. {
    deny all;
}
```
