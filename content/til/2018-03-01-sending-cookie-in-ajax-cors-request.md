+++
date = "2018-03-01T23:59:59"
title = "#TIL : Sending Cookie in AJAX CORs request"
description = "I learned in 2018-03-01 about web, http, browser"
categories = ["Today I learned", "web"]
tags = ["web", "http", "browser"]
+++



## Sending Cookie in AJAX CORs request

By default, browser will remove the cookie and authorization header from AJAX CORs request. So
before sending out the request, make sure `withCredentials` must be true.

In this case, CORs response must specify which origin is allowed (mean
no wildcard allowed origin rule).
