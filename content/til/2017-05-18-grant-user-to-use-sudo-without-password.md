+++
date = "2017-05-18T23:59:59"
title = "#TIL : Grant user to use sudo without password"
description = "I learned on 2017-05-18 about sysadmin, linux"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "linux"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Grant user to use sudo without password

This is bad practice but it's kind of hacky thing if you YOLO

```bash
# Create a user with home dir and bash shell (if you don't have yet)
$ useradd -m YOURUSERNAME -s /bin/bash
$ sudo vi /etc/sudoers
```

Add this line below `root    ALL=(ALL:ALL) ALL` (**User privilege specification** section)

```bash
$ YOUR_USERNAME     ALL=(ALL:ALL) NOPASSWD:ALL
```

Then press `:wq!` to force saving the file

![make me a sandwich sudo](https://imgs.xkcd.com/comics/sandwich.png)

Enjoy sudo !
