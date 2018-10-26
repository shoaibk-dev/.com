+++
date = "2018-10-25T23:59:59"
title = "#TIL : Detect HTTP Response 304 Status Code in AJAX"
description = "I learned on 2018-10-25 about caching, javascript, http, fetch"
categories = ["Today I learned", "javascript"]
tags = ["caching", "javascript", "http", "fetch"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Detect HTTP Response 304 Status Code in AJAX

Sometimes, you have a interval timer to retrieve new data updates from AJAX requests. But even the response status code of response is 304 (no body), the browser will treat it as 200 response and copy the cached body from browser cache to response body. So it will trigger the re-rederning UI components.

The way we can detect it is via its response headers list.

This example is using `fetch` API (which is supported in major browsers nowaday)

```js
fetch('https://some.thing/has/data')
.then(function (res) {
	if (res.headers.get('status') == '304 Not Modified') {
		return null;
	}
	return res.json();
})
.then(function (data) {
	if (data == null) return;

	// Render your data below
	renderUI(data);
});
```
