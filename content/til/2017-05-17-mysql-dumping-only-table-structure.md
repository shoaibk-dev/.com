+++
date = "2017-05-17T00:00:01"
title = "#TIL : Mysql dumping only table structure"
description = "I learned on 2017-05-17 about mysql"
categories = ["Today I learned", "mysql"]
tags = ["mysql"]
+++



## Mysql dumping only table structure

Adding `-D` to dump only data structure

Example :

```bash
$ mysqldump -h 127.0.0.1 -u root -p"something" -D database1 > db.sql
```
