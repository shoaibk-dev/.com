+++
date = "2017-09-27T23:59:59"
title = "#TIL : Send ENTER key to kernel"
description = "I learned on 2017-09-27 about keyboard, linux"
categories = ["Today I learned", "linux"]
tags = ["keyboard", "linux"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Send ENTER key to kernel

When you try to send an Enter keyboard to linux kernel, it looks like nothing happens.

This is because you only send a key press (KEY DOWN) but don't send an key release (KEY UP) event after that.
