+++
date = "2017-09-07T00:00:01"
title = "#TIL : Lock and unlock a user password"
description = "I learned on 2017-09-07 about sysadmin"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin"]
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
