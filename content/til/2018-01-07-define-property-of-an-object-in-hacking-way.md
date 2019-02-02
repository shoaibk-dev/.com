+++
date = "2018-01-07T00:00:01"
title = "#TIL : Define property of an object in hacking way"
description = "I learned on 2018-01-07 about javascript"
categories = ["Today I learned", "javascript"]
tags = ["javascript"]
+++



## Define property of an object in hacking way

Sometimes, we want to define a property of an advanced object (has setter and getter function).

Now, we could use this helper function `Object.defineProperty` to define property of an object in a cool way.

Example :

```js
const foo = {};

Object.defineProperty(a, 'bar', {
	value: 'hogehoge',
	writable: false,
});

console.log(foo.bar); // 'hogehoge'
foo.bar = 'foo bar'; // throw an error in strict mode
console.log(foo.bar); // still be 'hogehoge'
```

Modifying setter, getter function

```js
// Get callstack which function is getting or setting cookie value
Object.defineProperty(document, 'cookie', {
	get: function() {
		console.log('get !');
		console.trace();
	},
	set: function(val) {
		console.log('set = ', val);
		console.trace();
	},
}); 
```
