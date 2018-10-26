+++
date = "2018-01-16T23:59:59"
title = "#TIL : Disable IPv6 to stop getting stuck in network"
description = "I learned on 2018-01-16 about networking, linux"
categories = ["Today I learned", "linux"]
tags = ["networking", "linux"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Disable IPv6 to stop getting stuck in network

I know IPv6 will be future for networking, but at this moment "It's suck !" :(

Some service will be failed when trying to connect IPv6 destination :

- apt package manager
- smtp
- curl

So I decided to disable IPv6 on every production server.

```bash
$ echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
$ echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
$ echo "net.ipv6.conf.lo.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
$ 
$ sudo sysctl -p
```

I will re-enable it when everything works perfectly !
