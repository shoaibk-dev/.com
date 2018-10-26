+++
date = "2017-10-07T23:59:59"
title = "#TIL : Using netcat as tiny TCP debug tool"
description = "I learned on 2017-10-07 about sysadmin, tool, networking"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "tool", "networking"]
+++



## Using netcat as tiny TCP debug tool

You can use `netcat` or `nc` as a debugging TCP tool. It can be a TCP sender and receiver with a short session (auto close when connection is closed)

Examples :

Scan ports

```bash
$ nc -zv 127.0.0.1 20-80
```

Check redis status

```bash
$ echo 'info' | nc 127.0.0.1 6379
```

Retrieve http response

```bash
$ printf "GET /xinchao HTTP/1.1\r\n\r\n" | nc 127.0.0.1 8000 | tee xinchao.txt
```

Change to IPv6 : `nc -6`

**Want more ??**

```bash
$ nc -h
```
