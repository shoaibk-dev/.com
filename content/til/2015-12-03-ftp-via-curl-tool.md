+++
date = "2015-12-03T23:59:59"
title = "#TIL : FTP via curl tool"
description = "I learned on 2015-12-03 about sysadmin, ftp, curl"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "ftp", "curl"]
+++



## FTP via curl tool

Can upload an file via FTP by curl tool with handy script :

```bash
curl -T file_need_to_upload ftp://hostname --user user:passwd
```
