---
title: "Webfonts Optimization Using Nginx"
date: 2017-08-16T22:56:05+07:00
tags: ["webfont", "nginx", "cache", "proxy"]
description: "Make webfont great again !!!"
categories: ["Tech"]
image: "/images/2017/08/google-web-fonts.jpg"

---

## Context

Everytime you decided to use a webfont on your web, you think about Google Web Fonts, which is the best CDN for webfonts at this moment.

So why Google Fonts is good solution :
- Have many popular and updated fonts
- Global CDN
- Easy UX to get started
- Auto detects user's browser then return supported font type ([TTF](http://caniuse.com/#feat=ttf), [WOFF](http://caniuse.com/#feat=woff) or [WOFF2](http://caniuse.com/#feat=woff2))

## But

- It's a tracking endpoint (collect data to Google)
- Network latency (you have a CDN in your country)

## Solution

We use a simple Node server and NGINX with proxy cache mod to resolve this case.

Firstly, simple Node server will proxy your CSS request to CSS endpoint belonged to Google, then replace Google hostnames to your new hostname.

Secondly, NGINX tries to detect your browser via User-Agent header, then forward the same User-Agent type to origin Google server.

Lastly, NGINX server will proxy all fonts request to Google fonts server and cache the file in local system then serve same request later.

Source code is here : https://github.com/khanhicetea/google-fonts-resolver

## Installation

```bash
$ npm install
$ node main.js [proxy_fonts_hostname] [port=3000]
```

## Usage

NGINX configuration file

```nginx
proxy_cache_path /var/nginx/cdn_cache levels=1:2 use_temp_path=off keys_zone=cdn_cache:1024m max_size=1G inactive=14d;

map $http_user_agent $ua_fonts {
    default 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36';
    ~(MSIE\ 8) 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)';
    ~(MSIE|iPhone|Version) 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)';
}

server {
	listen 443 http2;
	listen [::]:443 http2;

	server_name [proxy_fonts_hostname];
	
	ssl_certificate	 /etc/nginx/key/[proxy_fonts_hostname].crt;
	ssl_certificate_key /etc/nginx/key/[proxy_fonts_hostname].key;

    location /css {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header User-Agent $ua_fonts;
        proxy_redirect off;

        proxy_cache cdn_cache;
        proxy_cache_key "$request_uri$ua_fonts";
        proxy_cache_lock on;
        proxy_cache_lock_age 5s;
        proxy_cache_lock_timeout 5s;
        proxy_cache_methods GET;
        proxy_cache_valid 200 1d;
        proxy_cache_valid any 60s;

        add_header X-Cache-Status $upstream_cache_status;

        expires 7d;
    }

    location / {
        proxy_pass https://fonts.gstatic.com/;
        proxy_http_version 1.1;
        proxy_set_header User-Agent $http_user_agent;
        proxy_set_header Host fonts.gstatic.com;
        proxy_redirect off;

        proxy_cache cdn_cache;
        proxy_cache_key "$request_uri";
        proxy_cache_lock on;
        proxy_cache_lock_age 5s;
        proxy_cache_lock_timeout 5s;
        proxy_cache_methods GET;
        proxy_cache_valid 200 7d;
        proxy_cache_valid any 60s;

        add_header X-Cache-Status $upstream_cache_status;

        expires 7d;
    }
}
```


1. Restart your NGINX server !
2. Try to select a web font on Google Fonts
3. Replace import url hostname to your hostname
4. Enjoy the speed !!!!!

## A BONUS TIP

Place your webfont import url to a `preload` link tag to ask the browser load the style immediate after loading HTML

```html
<link rel="preload" href="https://[your-font-cdn]/css?family=Noto+Sans:400,400i,700,700i&amp;subset=vietnamese" type="style">
```

## Benchmark

When I tried this solution with our CDN located in Vietnam, the result is better than 3-7 times (reduce latency and download time).
