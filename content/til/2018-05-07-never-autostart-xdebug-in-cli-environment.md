+++
date = "2018-05-07T00:00:01"
title = "#TIL : Never autostart XDebug in cli environment"
description = "I learned on 2018-05-07 about debug, php"
categories = ["Today I learned", "php"]
tags = ["debug", "php"]
+++



## Never autostart XDebug in cli environment

TLDR;

> Never ever enable xdebug.remote_autostart in cli

Xdebug is handy extension helps you debug your PHP code. But it slows the performance in cli mode, especially run PHP cli tool like composer or phpunit.

So please disable Xdebug in cli mode or set `xdebug.remote_autostart=0` in INI file.
