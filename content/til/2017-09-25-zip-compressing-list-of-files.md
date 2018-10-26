+++
date = "2017-09-25T23:59:59"
title = "#TIL : Zip compressing list of files"
description = "I learned on 2017-09-25 about compress, tools, zip"
categories = ["Today I learned", "tools"]
tags = ["compress", "tools", "zip"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Zip compressing list of files

To specify a list of compressed files when using **zip** cli tool, you could use `-@ [file_list]` flag. And `file_list` is a file contains list of compressed file (new line separated)

Example

```bash
$ zip changed.zip -@ changed_files.txt
```

Or use stdin pipe

```bash
$ find . -mmin -60 -print | zip changed_1_hour_ago -@
```

This will zip all changed files 1 hour ago
