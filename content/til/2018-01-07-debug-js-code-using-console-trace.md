+++
date = "2018-01-07T00:00:01"
title = "#TIL : Debug js code using console.trace"
description = "I learned on 2018-01-07 about debug, javascript"
categories = ["Today I learned", "javascript"]
tags = ["debug", "javascript"]
+++



## Debug js code using console.trace

Browsers provide an useful function help you debug easier than using simple `console.log` function.

That is `console.trace`, which prints a stack trace to called function.

Example :

```js
function foo() {
	var a = 1;
	bar(a);
}
function bar(x) {
	console.log(x);
	console.trace();
}

foo();
```
