+++
date = "2017-09-07T23:59:59"
title = "#TIL : Lock and unlock a user password"
description = "I learned on 2017-09-07 about sysadmin"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Lock and unlock a user password

In Linux, you can prevent a user from login by locking it.

**Lock**

```bash
$ sudo passwd -l [user]
```

**Unlock**

```bash
$ sudo passwd -u [user]
```
