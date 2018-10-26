---
title: "SESWatcher : how to prevent Amazon SES account from being suspended"
date: 2018-08-21T14:38:08+07:00
description: "SESWatcher - Your SES watchman"
categories: ["Python", "Web", "Cloud"]
tags: ["python", "tool", "email", "aws", "amazon", "cloud", "english"]
image: "images/2018/08/aws-ses-logo.png"
---

## Introdution

At this moment, AWS SES service is the best affordable price and high-quality service to sending (and receiving) programmatic emails. But, one day your account could be suspended without notice, and that takes a big effort of requesting support to get it back to work.

So it's good to prevent that siatuation happens by watching your Bounces Rate and Complaints Rate. One way to resolve problem when your rates being too-high than allowance, is send a **big amount of dummy emails to your blackhole email address**.

## Example

*These is your send statistics :*

- Deliveries : 2000
- Bounces : 180 ==> Bounces Rate : 180 / 2000 = 9%
- Complaints : 30 ==> Complaints Rate : 30 / 2000 = 1.5%

Meaning :

- Bounces : when your email didn't send to existed email address (maybe your user type wrong or input fake one), we can pre-validate email before sending by using some email validator library or services like [fast-email-validator](https://github.com/khanhicetea/fast-email-validator)
- Complaints : when your receiver mark your email as SPAM :( Poor you !!!

## Solution

*AWS SES rules :*

- Bounces Rate : 5% => So you have to send more `(180 / 4%) - 2000 = 2500` emails to reduce Bounces Rate to 4%
- Complaints Rate : 0.1% => So you have to send more `(30 / 0.07%) - 2000 = 40857` emails to reduce Complaints Rate to 0.07%

*==> Number emails send = max(2500, 40857) = 40857 emails*

> SPAM YOURSELF 40857 EMAILS !!! 😂

## SESWatcher - Your SES watchman

It's open source software at https://github.com/khanhicetea/seswatcher (My first PyPi package :D)

### Installation

```bash
$ pip install seswatcher
```

### Usage

1. Step 1 : Get AWS Credential User within **AmazonSESFullAccess** policy
2. Step 2 : Verify sender email in AWS SES
3. Step 3 : Get a blackhole email address which receives un-important emails.
4. Step 4 : Create a hourly cronjob that runs **seswatcher**

```bash
$ seswatcher [OPTIONS] ACCESS_KEY SECRET_KEY FROM_EMAIL TO_EMAIL
```

Get help :

```bash
$ seswatcher --help
Usage: seswatcher [OPTIONS] ACCESS_KEY SECRET_KEY FROM_EMAIL TO_EMAIL                                                   

Options:                      
  --region TEXT       AWS SES Region (default is us-east-1) 
  --interval INTEGER  Timer interval                        
  --help              Show this message and exit.
```
