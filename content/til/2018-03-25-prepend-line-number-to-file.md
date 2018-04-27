+++
date = "2018-03-25T23:59:59"
title = "#TIL 2018-03-25 : Prepend line number to file"
description = "I learned in 2018-03-25 about sysadmin, string, file"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "string", "file"]
+++



## Prepend line number to file

When you want to prepend **line number** in every line of file, use the `-n` flag of `cat` tool.

Example :

`cat -n a.txt`

Or even from many file

`cat -n a.txt b.txt c.txt`
