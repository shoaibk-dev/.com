---
title: "Boost Docker CI Build Speed to ~10X times"
date: 2019-01-17T22:12:55+07:00
description: "As an software engineering developer, you know that automated CI testing is the one of keys to improve software release life cycle."
categories: ["devops", "linux"]
image: "/images/2019/01/continuous-integration.png"
tags: ["docker", "ci", "linux", "tmpfs"]
---

As an software engineering developer, you know that automated CI testing is one of keys to improve software release life-cycle.

But sometimes reality is not as good as you think, CI testing speed is slow (3-10 minutes / build) and it slows the release cycle speed down. And you try to look into your build logs to find out what causes the problem. Then you got it, it’s mostly the DATABASE service (MySQL, Postgres, MongoDB, …)

I will summarize some stages of your database in a testing build:

- First, it initializes the data, loads config and listens to the connections (takes around 10-45 seconds)
- Second, that you import your testing database into the server (including schemas and initialized data) takes around 20-60 seconds
- Then, on each test case, it needs to clear all data then re-imports fixture data (takes around 30-120 seconds)

So how to make these servers run as fast as possible like some Key-Value databases do? (Redis, Memcached). The main different point is the MEMORY! What if we put all data inside memory??

All of we know that RAM speed with 150 times lower latency is [technically better than SSD and HDD speed](https://www.theregister.co.uk/2016/04/21/storage_approaches_memory_speed_with_xpoint_and_storageclass_memory/). And as a matter of fact, Linux is a good OS that supports a lot of filesystems, specially tmpfs, which you can mount files into your RAM memory.

However, nothing is perfect and this is not an exception. Actually, it is not a good option for persistent data which is not necessary for testing database. What it really needs is speed only, so it fits in.

That’s my idea, now I will try to test it on my CI environment (I use [DroneCI](https://github.com/drone/drone) using Docker). In new version 0.8+ of DroneCI, they support us to run docker containers within **tmpfs mount**.

So I just add this line into my drone config

```yml
services:
  testdatabase:
    image: mysql:5.7
    # Add this 2 lines below to boost your database container
    tmpfs:
      - /var/lib/mysql
    environment:
      - MYSQL_DATABASE=testdb
      - MYSQL_ROOT_PASSWORD=passwd
```

**Result**:

- MySQL service initialize in 3 seconds instead of 25 seconds
- Import testing database using mysql client takes only below 1 second instead of 17 seconds
- My test cases run faster 20-30% (I have few testcases use database)

> So, worth a shot !!

---------------------

**Ref:**

- Cover photo from [dotnetvibes.com](https://dotnetvibes.com/2018/04/10/continuous-delivery-is-not-continuous-deployment/)