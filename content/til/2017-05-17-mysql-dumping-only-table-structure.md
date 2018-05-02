+++
date = "2017-05-17T23:59:59"
title = "#TIL : Mysql dumping only table structure"
description = "I learned in 2017-05-17 about mysql"
categories = ["Today I learned", "mysql"]
tags = ["mysql"]
+++



## Mysql dumping only table structure

Adding `-D` to dump only data structure

Example :

```bash
$ mysqldump -h 127.0.0.1 -u root -p"something" -D database1 > db.sql
```
