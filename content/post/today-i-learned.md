+++
date = "2015-11-30T17:22:46+07:00"
title = "Today I Learned - automated tool helps you learn everyday."
description = "We constantly learn new things. This is a repo to share those learnings. TILs are short Markdown documents (a few sentences + example code) explaining concepts, bits of syntax, commands, or tips we've recently learned."
categories = ["Productivity"]
tags = ["tools", "productivity", "english"]
image = "/images/2015/12/learn_everyday.gif"
toc = true
+++

## Introduction

We constantly learn new things. This is a repo to share those learnings. TILs are short Markdown documents (a few sentences + example code) explaining concepts, bits of syntax, commands, or tips we've recently learned.

Today-I-Learn (TIL) is inspired by Thoughbot, TIL is a repository for everyone to share what we have learn today.

This repo has a tool that help you to manage and write down what you learned in scientific way. [https://github.com/khanhicetea/today-i-learned](https://github.com/khanhicetea/today-i-learned)

And this is my repo used TIL : [https://github.com/khanhicetea/what-i-leaned-today](https://github.com/khanhicetea/what-i-leaned-today)

## Instruction

### Step 1 : Fork this repo (blank-repo with only tool and readme file).
### Step 2 : Start writting down what you learned in everyday.

- Create a topic

```shell
$ ./til [CATEGORY] [SUBJECT]
```
Ex:

```shell
$ ./til bash "Bash Conditional Expression"
```

It will create 1 file `bash/Bash-Conditional-Expression.md`

- Write content
- Save it !

### Step 3 : Commit what you learned today

```shell
$ ./til commit
```

After that, if you want to push it to repository, just Enter.

## License
© 2015 khanhicetea. Distributed under the Creative Commons Attribution License.

## Ref

- Cover photo : [Inspirational Picture Quotes](http://inspirationalpicturequotes.blogspot.com/2013/03/knowledge-is-learning-something-new.html)