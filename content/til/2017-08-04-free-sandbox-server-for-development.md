+++
date = "2017-08-04T00:00:01"
title = "#TIL : Free sandbox server for development"
description = "I learned on 2017-08-04 about heroku, devops, free"
categories = ["Today I learned", "devops"]
tags = ["heroku", "devops", "free"]
+++



## Free sandbox server for development

We can use Heroku as a forever-free sandbox solution for testing or hosting micro service. Adding a credit card to have 1000 free computing hours.

Heroku will make a service down if no received request come. We can use a cronjob-like service to check service health and keep it live !!! ;)

Cronjob check health SASS : pingdom, statuscake, port-monitor, uptimerobot

**Btw, I don't recommend you keep service live but no use, it makes Heroku infrastructure heavy and THAT'S NOT FAIR for them !**
