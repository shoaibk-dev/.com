+++
date = "2017-05-22T23:59:59"
title = "#TIL : zcat : decompressing pipe tool"
description = "I learned in 2017-05-22 about sysadmin, tool, bash, compressing"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "tool", "bash", "compressing"]
+++



## zcat : decompressing pipe tool

`zcat` is a tool that creates a pipe from gz file. It makes command cleaner and faster (maybe). You don't have to decompress gz file before using next tool.

**Examples :**

*Finding string in gzip text file*

```bash
$ zcat secret.gz | grep '42'
```

*Importing SQL backup file*

```bash
$ mysqldump -u root -p db_name1 | gzip > db_name.sql.gz
$ zcat db_name.sql.gz | mysql -u root -p db_name_2
```
