+++
date = "2017-09-07T00:00:01"
title = "#TIL : Generate dhparam file faster"
description = "I learned on 2017-09-07 about sysadmin"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin"]
+++



## Generate dhparam file faster

**openssl** uses strong prime (which is useless for security but requires an awful lot more computational effort. A "strong prime" is a prime p such that (p-1)/2 is also prime). So it will be faster if we add option `-dsaparam` to the command

```bash
$ openssl dhparam -dsaparam -out /etc/ssl/private/dhparam.pem 4096
```

Ref : https://security.stackexchange.com/a/95184
