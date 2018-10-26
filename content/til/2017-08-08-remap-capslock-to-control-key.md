+++
date = "2017-08-08T23:59:59"
title = "#TIL : Remap Capslock to Control key"
description = "I learned on 2017-08-08 about keyboard, linux"
categories = ["Today I learned", "linux"]
tags = ["keyboard", "linux"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Remap Capslock to Control key

Edit file `/etc/default/keyboard` and set 

```
XKBOPTIONS="ctrl:nocaps"
```

Then, logout and log in again to impact
