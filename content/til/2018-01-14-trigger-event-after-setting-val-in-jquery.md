+++
date = "2018-01-14T23:59:59"
title = "#TIL 2018-01-14 : Trigger event after setting val in jQuery"
description = "I learned in 2018-01-14 about jquery, javascript"
categories = ["Today I learned", "javascript"]
tags = ["jquery", "javascript"]
+++



## Trigger event after setting val in jQuery

After setting value of an input via `val` method, we should call the `change` chaining method to trigger the `onChange` event of element.

```js
$('#selectCity').change(function() {
	console.log($(this).val());
});

$('#selectCity').val('HaNoi'); // No trigger

$('#selectCity').val('HoChiMinh').change(); // Fire trigger
```