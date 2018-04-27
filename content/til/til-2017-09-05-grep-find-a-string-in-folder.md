+++
date = "2017-09-05T23:59:59"
title = "#TIL 2017-09-05 : Grep : find a string in folder"
description = "I learned in 2017-09-05 about sysadmin, grep"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "grep"]
+++



## Grep : find a string in folder

Grep is a greate tool for searching a string in files.

**Syntax**

```bash
$ grep -nr '[string]' [folder]
```

If you want to show surrounding lines the result, add flag `-C [number]` to the command

```bash
$ grep -nr -C 3 'hello' src
```
