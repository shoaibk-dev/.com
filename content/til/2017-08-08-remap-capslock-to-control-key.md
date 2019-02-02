+++
date = "2017-08-08T00:00:01"
title = "#TIL : Remap Capslock to Control key"
description = "I learned on 2017-08-08 about keyboard, linux"
categories = ["Today I learned", "linux"]
tags = ["keyboard", "linux"]
+++



## Remap Capslock to Control key

Edit file `/etc/default/keyboard` and set 

```
XKBOPTIONS="ctrl:nocaps"
```

Then, logout and log in again to impact
