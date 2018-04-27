+++
date = "2017-08-04T23:59:59"
title = "#TIL 2017-08-04 : HTTP2 supported for python requests library"
description = "I learned in 2017-08-04 about python, requests, http2"
categories = ["Today I learned", "python"]
tags = ["python", "requests", "http2"]
+++



## HTTP2 supported for python requests library

The sophisticated http client in Python is `requests`, it has simple API but powerful features. You can use it for crawling, sending request to third-party API or writing tests.

Btw, at this moment it doesn't support HTTP/2 protocol (actually we often doesn't need its `Server Push` or `Multi resource stream` features). But sometime the API endpoint only supports HTTP/2 like Akamai Load Balacing service.

The hero is new library named `hyper`, it has been developing to support full HTTP/2 specs. But if all we need is requesting single request to a HTTP/2 server. It works like a charm.

### Installation

```
$ pip install requests
$ pip install hyper
```

### Usage

```python
import requests
from hyper.contrib import HTTP20Adapter
s = requests.Session()
s.mount('https://', HTTP20Adapter())
r = s.get('https://cloudflare.com/')
print(r.status_code)
print(r.url)
```

This mean any url has prefix `https://` will be hanlded by **HTTP20Adaper** of **hyper** library

### Notice

If you run above example, you will see the result

```
200
https://cloudflare.com/
```

While you expected it would auto-follow redirect to the page `https://www.cloudflare.com/`

We can fix it by using the newer version than `0.7.0` to fix the **header key bytestring issue**

```
$ pip uninstall hyper
$ pip install https://github.com/Lukasa/hyper/archive/development.zip
```

Then try it out !!!
