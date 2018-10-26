+++
date = "2018-05-29T23:59:59"
title = "#TIL : Put .git data outside project directory"
description = "I learned on 2018-05-29 about git, secutiry"
categories = ["Today I learned", "git"]
tags = ["git", "secutiry"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Put .git data outside project directory

Sometimes you want to put .git data into outside directory (to use another disk partition or to protect your git data). Use `--separate-git-dir=` option to get that.

Example :

```bash
$ git init --separate-git-dir=/var/gitstorage/myproject
```

Bonus : to protect .git data from other users, use this option `--shared` within octal value (same to `chmod`)

Example : this will protect git file from writing by group and reading/writing by others

```bash
$ git init --separate-git-dir=/var/gitstorage/myproject --shared=0640
```
