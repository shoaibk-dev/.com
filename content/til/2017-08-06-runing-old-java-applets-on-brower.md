+++
date = "2017-08-06T23:59:59"
title = "#TIL : Runing old java applets on brower"
description = "I learned on 2017-08-06 about security, java"
categories = ["Today I learned", "java"]
tags = ["security", "java"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Runing old java applets on brower

Mostly morden browser has stop support Java plugins, so you can't run Java applet on browser.

Temporary way :
- run in IE or Safari
- run in an old Firefox (version 23)

And what if old java applet can't be runned on Java 8 because of weak signature algorithm. Try this

- Open `java.security` file :
   - In MacOS, located in `/Library/Java/JavaVirtualMachines/jdk[jdk-version].jdk/Contents/Home/jre/lib/security`
   - In Windows, located in `C:\Program File x86\Java\jre\lib\security`
- Comment this line, ```jdk.certpath.disabledAlgorithms=MD2, MD5, RSA keySize < 1024```
- Rerun applet
