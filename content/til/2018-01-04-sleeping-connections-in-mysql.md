+++
date = "2018-01-04T00:00:01"
title = "#TIL : Sleeping connections in MySQL"
description = "I learned on 2018-01-04 about web, db, mysql"
categories = ["Today I learned", "mysql"]
tags = ["web", "db", "mysql"]
+++



## Sleeping connections in MySQL

When you check your MySQL process list via command `show processlist;`, it will show you a useful table which provide all current connection details.

"Sleep" state connections are most connection pointer waiting for the timeout to terminate. Then they still count as a connection. (Can cause MySQL connection limit error, which default equal 150 connections)

So next time, remember to close your connection before terminating your app.

> Every connection counts ;)
