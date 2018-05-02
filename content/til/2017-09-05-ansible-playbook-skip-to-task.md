+++
date = "2017-09-05T23:59:59"
title = "#TIL : Ansible playbook : skip to task"
description = "I learned in 2017-09-05 about sysadmin, ansible"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "ansible"]
+++



## Ansible playbook : skip to task

You can skip to a task by its name by adding parameter `--start-at`

```bash
$ ansible-playbook playbook.yml --start-at="[your task name]"
```
