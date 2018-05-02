+++
date = "2017-05-17T23:59:59"
title = "#TIL : Compressing and Extracting files with rar in Linux"
description = "I learned in 2017-05-17 about sysadmin, rar, compressing"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "rar", "compressing"]
+++



## Compressing and Extracting files with rar in Linux

### zip and tar disadvantages

**All unicode filename will be transform to weird character, so it makes broken paths and broken links**

### Notice

**rar** and **unrar** in Linux isn't same version and so don't use **unrar** to extract archived file by **rar** (It causes invalid full paths)

### Installation

Ubuntu :

```bash
$ sudo apt install rar
```

Redhat ( using [RPMForge](http://repoforge.org/use/) )

```bash
$ sudo yum install rar
```

### Compressing files, folder

Compressing files

```bash
$ rar a result.rar file1 file2 file3 fileN
```

Compressing dir and its subdirs (remember with trailing slash in the end)

```bash
$ rar a -r result.rar folder1/
```

Locking RAR file with password (adding `-p"THE_PASSWORD_YOU_WANT"`)

```bash
$ rar a -p"0cOP@55w0rD" result.rar file1 file2 file3 fileN
$ rar a -p"0cOP@55w0rD" -r result.rar folder1/
```


### Extracting file

Listing content of RAR file

```bash
$ rar l result.rar
```

Extracting RAR file to current dir

```bash
$ rar e result.rar
```

Extracting RAR file to current dir with fullpath

```bash
$ rar x result.rar
```

### WANT MORE ?

Asking it !

```bash
$ rar -?
```

### BONUS

> WHAT IF I TOLD U THAT A RAR FILE BIGGER 35 TIMES THAN ITS ORIGINAL FILE ?

```bash
$  echo 'a' > a.txt
$  rar a a.rar a.txt

RAR 3.80   Copyright (c) 1993-2008 Alexander Roshal   16 Sep 2008
Shareware version         Type RAR -? for help

Evaluation copy. Please register.

Creating archive a.rar

Adding    a.txt                                                       OK 
Done
$  ls -al
total 72
-rw-r--r-- 1 root root    77 May 17 14:18 a.rar
-rw-r--r-- 1 root root     2 May 17 14:17 a.txt
```

![bus rar](https://cloud.githubusercontent.com/assets/4528223/26142566/44a8d4f0-3b0b-11e7-8f03-271fd1326215.jpg)
