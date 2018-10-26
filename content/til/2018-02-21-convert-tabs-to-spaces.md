+++
date = "2018-02-21T23:59:59"
title = "#TIL : Convert tabs to spaces"
description = "I learned on 2018-02-21 about vim"
categories = ["Today I learned", "vim"]
tags = ["vim"]
+++



## Convert tabs to spaces

This is my config to use 4 spaces instead tab

```
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
```

To convert existing file from tabs to spaces, use this command

```
:%retab
```
