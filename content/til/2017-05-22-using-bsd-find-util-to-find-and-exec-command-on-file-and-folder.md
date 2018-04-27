+++
date = "2017-05-22T23:59:59"
title = "#TIL 2017-05-22 : Using BSD find util to find and exec command on file and folder"
description = "I learned in 2017-05-22 about sysadmin, util, shell"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "util", "shell"]
+++



## Using BSD find util to find and exec command on file and folder

Simple syntax of find

```bash
$ find [find_path] -type [file_type] -exec [command] {} \;
```

Add filename matching pattern to filter the result

```bash
$ find [find_path] -name "*.php" -type [file_type] -exec [command] {} \;
```

**Where `file_type`** is :

- b : block special
- c : character special
- d : directory
- f : regular file
- l : symbolic link
- p : FIFO
- s : socket

**Examples:**

*Fix common file and directory permissions*

```bash
$ find . -type f -exec chmod 644 {} \;
$ find . -type d -exec chmod 755 {} \;
```

*Check syntax all PHP files*

```bash
$ find . -type f -name "*.php" -exec php -l {} \; | grep -v 'No syntax errors detected'
```

*Removed all log files*

```bash
$ find . -type f -name "*.log" -exec rm -f {} \;
```

**WANT MORE ???**

```bash
$ man find
```
