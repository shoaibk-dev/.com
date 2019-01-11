---
title: "SaaS Multi-tenant Architecture - Part 1"
date: 2019-01-11T21:55:38+07:00
categories: ["Software", "Architecture"]
tags: ["software", "architecture", "sass", "multitenant"]
image: "/images/2019/01/sass.png"
toc: true
---

## What is SaaS Multi-tenant?

SaaS (Software as a Service) or "on-demand software" has become a common delivery model for many bussiness software applications nowaday. It means when customers register the service, they get the software right-away.

In case customer want an isolated software (means other customers can't read and write their data), then the multi-tenant architecture is your right choice ! 

## Common strategies

We have many ways to build a multi-tenant system, but there are 3 common strategies:

- Shared database, shared schemas
- Shared database, seperated schemas
- Separated database

Every strategy has pros and cons and nothing in software is silver bullet. So pick the strategy fit to your requirements.

## Separated database 

But today, I will write about my chosen strategy (Separated database).

The most important things you have to remember is what being shared and separated between different tenants:

- **SHARED**
	- **Infrastructures**
    	- Hosts
        - Networking
	- **Platforms**
    	- Load balancer
    	- Databases
        - Key-Value storages
        - Monitoring
	- **Software**
    	- Application tenant code
- **SEPARATED**
	- Database
    - Metadata (about tenant info)
    - Environment variables
    - File storages
    - Subscription Plans
    - Endpoints
    - Queues (job queues)

*To be continued ...*

--------------------

Ref:
    - Cover photo from [hackernoon](https://hackernoon.com/saas-software-as-a-service-platform-architecture-757a432270f5)