+++
date = "2017-05-18T00:00:01"
title = "#TIL : Cloudflare Error 522 Connection Time out"
description = "I learned on 2017-05-18 about web, cloudflare, error"
categories = ["Today I learned", "web"]
tags = ["web", "cloudflare", "error"]
+++



## Cloudflare Error 522 Connection Time out

If you are using Cloudflare as a proxied web server, it will provide many benefits about performance (assets caching, prevent DDOS and cheap CDN). But sometimes, you will face to this error "522 Connection Time out".

The problems caused by :

- Networking (CF can't touch origin server : Firewall blocking, Network Layer #1,#2,#3 issue)
- Timeout (origin server process too long than 90 seconds)
- Empty or invalid response from origin server
- No or big HTTP headers (> 8Kb)
- Failed TCP handshake

**Ref:**

- https://support.cloudflare.com/hc/en-us/articles/200171906-Error-522-Connection-timed-out
- https://support.cloudflare.com/hc/en-us/articles/200171936-Error-520-Web-server-is-returning-an-unknown-error
