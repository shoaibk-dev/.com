+++
date = "2018-01-30T23:59:59"
title = "#TIL : Using mark to bookmark checkpoints in files"
description = "I learned on 2018-01-30 about editor, vim"
categories = ["Today I learned", "vim"]
tags = ["editor", "vim"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Using mark to bookmark checkpoints in files

Bookmarking a checkpoint will help you get back to it intermidately. Ex: your have to find some text to replace something but want to return back current position. 

**Set a mark**
- [NORMAL MODE] , type `m` then follow by a letter from a-z (lowercase is filescope, uppercase for global scope - vim scope)

**Go to a mark**
- [NORMAL MODE] , type backstick ` then follow by the letter your marked above.

**List all current marks**
- [NORMAL MODE], `:marks`
- It shows all marks included special ones :

| Command | Description |
| ------- | ----------- |
| `. | jump to position where last change occurred in current buffer |
| `" | jump to position where last exited current buffer |
| `0 | jump to position in last file edited (when exited Vim) |
| '' | jump back (to line in current buffer where jumped from) |
| `` | jump back (to position in current buffer where jumped from) |

**TIPS** : Can use it as a motion with `c`hange, `d`elete or `y`ank
