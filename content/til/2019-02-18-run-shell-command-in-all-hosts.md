+++
date = "2019-02-18T00:00:01"
title = "#TIL : Run shell command in all hosts"
description = "I learned on 2019-02-18 about ansible, devops"
categories = ["Today I learned", "ansible"]
tags = ["ansible", "devops"]
+++



## Run shell command in all hosts

To run a shell command in all hosts, you can use the module name `raw` and provide shell command to module args.

Example:

- To list all CPU model name of hosts

```bash
$ ansible all -m raw -a "cat /proc/cpuinfo | grep 'model name'"
```
