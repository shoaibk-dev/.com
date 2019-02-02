+++
date = "2018-11-13T00:00:01"
title = "#TIL : Telnet server through SSL or TLS"
description = "I learned on 2018-11-13 about tls, openssl, bash"
categories = ["Today I learned", "bash"]
tags = ["tls", "openssl", "bash"]
+++



## Telnet server through SSL or TLS

I often use `telnet` and `netcat` to debug my TCP server and client. But these tool only support plain connection, mean every data transfer between server and client is unencrypted and unsafe.

So if you want to achieve the same result through secure connection (SSL or TLS), use this command

```bash
$ openssl s_client -host example.com -port 443
$ # or short syntax
$ openssl s_client -connect example.com:443
```

I made a function named `telnets` in `.bash_profile` to make it easier to use

```bash
function telnets() {
	openssl s_client -host "$1" -port "$2"
}
```

then I just type this on bash shell within same syntax of `telnet`

```bash
$ telnets github.com 443
```

**TIP:** To hide detail of certificates, add `-quiet` flag into command

More info, check `openssl s_client -h`
