+++
date = "2017-10-20T23:59:59"
title = "#TIL : Using watch command to tracking changes in period time"
description = "I learned in 2017-10-20 about tool, watch, linux"
categories = ["Today I learned", "linux"]
tags = ["tool", "watch", "linux"]
+++



## Using watch command to tracking changes in period time

`watch` to a good command to run a command every N seconds.

And like its name, means you can **watch** something, its output changes with flag `-d`

It's a great tool to help you learn a new language without hitting compile and run everytime you save a file.

```bash
$ watch -n 1 -d go run learn.go
```

This command will compile and run **learn.go** every **1 second**

More flags :

- `-t` : no title
- `-b` : beep on non-zero exit code
- `-e` : stop loop on error and exit on a keypress
- `-g` : exit on change
- `-c` : support colors
- `-h` : you know ! ;)
