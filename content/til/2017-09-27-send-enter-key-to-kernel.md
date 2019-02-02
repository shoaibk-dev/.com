+++
date = "2017-09-27T00:00:01"
title = "#TIL : Send ENTER key to kernel"
description = "I learned on 2017-09-27 about keyboard, linux"
categories = ["Today I learned", "linux"]
tags = ["keyboard", "linux"]
+++



## Send ENTER key to kernel

When you try to send an Enter keyboard to linux kernel, it looks like nothing happens.

This is because you only send a key press (KEY DOWN) but don't send an key release (KEY UP) event after that.
