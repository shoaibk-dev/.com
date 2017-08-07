+++
date = "2017-04-14T00:21:14+07:00"
title = "Kick start a LEMP stack on Ubuntu 16.04"
description = "Kick start a LEMP stack on Ubuntu 16.04 in production"
categories = ["System", "Tech"]
tags = ["system", "devops", "bash", "php", "lemp"]

+++

> LEMP = Linux + EngineX(NginX) + MySQL + PHP

Too tired for doing same tasks over and over again. I made this script to help me (and you) on kicking start a new LEMP stack on production server. Hope it useful !

**What does script do :**

- Disable IPv6 (it's not ready for production at the moment)
- Configure firewall (only accepts port 22, 80 and 443)
- Disable password authentication to SSH service
- Upgrade system
- Install useful tools (git, screen, vim, curl and lego for LetsEncrypt ACME)
- NginX
- MySQL 5.7 (default root password is `passwd`, should be changed ASAP)
- PHP 7.1 (with production .ini)
- Composer (PHP package manager)
- AND last but not least, **a congratuation message** !

**Here is the script :**

{{< gist khanhicetea 4dcb9da3302866f896fa4fc9716a6746 "lemp_ubuntu_1604.sh" >}}

> STOP DOING SAME THING BUT EXPECTING DIFFERENT RESULTS