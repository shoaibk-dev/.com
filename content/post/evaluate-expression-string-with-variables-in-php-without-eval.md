---
title: "Evaluate expression string with variables in PHP without eval"
date: 2018-06-05T23:04:35+07:00
description: "Never ever use eval function in PHP ..."
categories: ["php"]
tags: ["php", "eval", "lambda", "english"]
---

## TLDR;

> Never ever use eval function in PHP !

Updated Jul 31 : we can use [Expression Language](https://github.com/symfony/expression-language)

## Introduction

In some applications, we need to let user defines the expression (user lambda function) to evaluate a value or a condition. So we store user-defined expression in database then using `eval` function and pass variables to that function.

It works, but not securely ! Remember this important thing :

> NEVER TRUST USER INPUT !

So how this article will show how we achieve the goal without touching `eval` or `create_function` function.

## Idea

The idea came out when I used **Ansible** tool (a Pythonic dev-ops tool, with great docs and community). Ansible uses jinja template engine as mainly syntax for many thing, to render the template file and to evaluate the condition **when** syntax.

Same in PHP, we have **Twig** template engine !

## Twigeval

This is my library (https://github.com/khanhicetea/twigeval) that using the above idea, one of few libraries which I write Unit Test for ;)

**Installation**

```bash
$ composer require khanhicetea/twigeval
```

**Usage**

```php
/*
$cacheDir could be :
    - false : no use cache (mean use eval function), be carefully !
    - null : use sys_get_temp_dir() to get system temp directory as cache dir
    - string : cache directory path
*/
$cacheDir = null;
$calculator = new KhanhIceTea\Twigeval\Calculator($cacheDir);

$math = $calculator->number('a / 4 + b * 3', ['a' => 16, 'b' => 3]);
// => 13

$boolean1 = $calculator->isTrue('(a and b) or c', ['a' => false, 'b' => true, 'c' => false]);
// => false

$boolean2 = $calculator->isFalse('(a and b) or c', ['a' => false, 'b' => true, 'c' => false]);
// => true

// We can even use Twig filters, functions
$string = $calculator->calculate('{{ a|reverse }} world !', ['a' => 'hello']);
// => olleh world !
```

**Voilà !!! We have user-defined lambda function.**

*Feel free to contribute ! Thanks ! :)*

Til next time !
