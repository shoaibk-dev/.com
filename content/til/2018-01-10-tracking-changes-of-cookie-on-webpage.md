+++
date = "2018-01-10T23:59:59"
title = "#TIL : Tracking changes of cookie on webpage"
description = "I learned on 2018-01-10 about debug, web, javascript"
categories = ["Today I learned", "javascript"]
tags = ["debug", "web", "javascript"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Tracking changes of cookie on webpage

Using `Object.defineProperty` helper function as I wrote 3 days ago. We could track the changes of cookie on webpage.

```js
// Based on Vlad Shevchenko's script at https://stackoverflow.com/a/36826049

var cookieSetterOrig = document.__lookupSetter__("cookie"); // get origin setter function
var cookieGetterOrig = document.__lookupGetter__("cookie"); // get origin getter function
Object.defineProperty(document, "cookie", {
    get: function () {
	console.trace();
        return cookieGetterOrig.apply(document);
    },
    set: function () {
	console.log(arguments);
	console.trace();
        return cookieSetterOrig.apply(document, arguments);
    },
    configurable: true
});
```

**Notice** : This code only works if cookie is changed by javascript, not http header request !
