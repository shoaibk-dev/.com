+++
date = "2017-09-25T23:59:59"
title = "#TIL : Blocking specified country to prevent from DDOS"
description = "I learned in 2017-09-25 about sysadmin, firewall, networking"
categories = ["Today I learned", "sysadmin"]
tags = ["sysadmin", "firewall", "networking"]
+++



## Blocking specified country to prevent from DDOS

Last day I checked system logs and got a lot of warning messages mentioned that my server has been attack via Brute-force. So I decided to blocked some countries from connecting to attacked ports (21, 25). They are China, Russia and US.

This site provides a list of IP blocks of specified country

http://www.ipdeny.com/ipblocks/
