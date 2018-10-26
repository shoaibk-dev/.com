+++
date = "2017-08-10T23:59:59"
title = "#TIL : Scope and Closure"
description = "I learned on 2017-08-10 about javascript"
categories = ["Today I learned", "javascript"]
tags = ["javascript"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Scope and Closure

Run this code

```js
for (var i=1; i<=5; i++) {
	setTimeout( function timer(){
		console.log( i );
	}, i*1000 );
}
```

What you expected

```
1
2
3
4
5
```

But, result is

```
6
6
6
6
6
```

Solution is

```js
for (var i = 1; i <= 5; i++) {
    setTimeout((function timer(j) {
        return function() {
            console.log(j);
        }
    })(i), i * 1000);
}
```

or

```js
for (var i=1; i<=5; i++) {
	(function(j){
		setTimeout( function timer(){
			console.log( j );
		}, j*1000 );
	})(i);
}
```
