+++
date = "2017-05-19T23:59:59"
title = "#TIL 2017-05-19 : wget Output flag"
description = "I learned in 2017-05-19 about sysadmin, shell"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "shell"]
+++



## wget Output flag

`-O` means output

```bash
$ # output file will be index.html or based on header filename
$ wget -O www.abc.xyz
```

```bash
$ # output file will be filename.html
$ wget -O filename.html www.abc.xyz
```

```bash
$ # output to stdout
$ wget -O- www.abc.xyz
$ wget -O- https://gist.githubusercontent.com/khanhicetea/4fa9f5103cd7fbc2d2270abce05c9c2b/raw/helloworld.sh | bash
```
