---
title: "SMTPor : Dead simple SMTP testing tool"
date: 2017-09-29T22:26:54+07:00
description: "Never need a bigass mail client to test your SMTP config"
categories: ["Nodejs", "Linux"]
tags: ["nodejs", "smtp", "product", "english"]
image: "/images/2017/09/mail-send.png"
toc: true
---

> Never need a bigass mail client to test your SMTP config !

Github Repo : https://github.com/khanhicetea/smtpor

## Demo

![SMTPor](https://user-images.githubusercontent.com/4528223/31022947-991302c2-a564-11e7-9ad6-13fddde7c46e.png)

## TL;DR

Using Docker to run

```bash
$ docker run -d -p 3000:3000 khanhicetea/smtpor
```

Then open **http://localhost:3000** to try a shot !

## Install & Start

```bash
$ npm install
$ npm start
```

## Heroku Deploying

```bash
$ heroku login
$ heroku git:remote -a [your-app-name]
$ git push heroku master
```

## Contributors

- @khanhicetea

## License

MIT License