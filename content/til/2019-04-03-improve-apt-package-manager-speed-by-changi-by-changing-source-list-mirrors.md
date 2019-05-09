+++
date = "2019-04-03T00:00:01"
title = "#TIL : Improve apt package manager speed by changi by changing source list mirrors"
description = "I learned on 2019-04-03 about packagemanager, devops, apt"
categories = ["Today I learned", "devops"]
tags = ["packagemanager", "devops", "apt"]
+++



## Improve apt package manager speed by changi by changing source list mirrors

Sometimes, you ran into issues that apt update package list so slow or even can not connect to the destination server.

You can change the default list into new one near your country. Get example : if you live in ASIA, choose the Singapore or Japan mirror instead of main mirror. you just change the **"archive.ubuntu.com" and "security.ubuntu.com" to "[country_code].archive.ubuntu.com"** in file list `/etc/apt/sources.list`

Then run `sudo apt update` to test your new mirror :)

**TIP** : you can generate the new source list file based on this online tool : https://repogen.simplylinux.ch/generate.php
