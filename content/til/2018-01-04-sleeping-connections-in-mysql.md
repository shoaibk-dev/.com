+++
date = "2018-01-04T23:59:59"
title = "#TIL 2018-01-04 : Sleeping connections in MySQL"
description = "I learned in 2018-01-04 about web, db, mysql"
categories = ["Today I learned", "mysql"]
tags = ["web", "db", "mysql"]
+++



## Sleeping connections in MySQL

When you check your MySQL process list via command `show processlist;`, it will show you a useful table which provide all current connection details.

"Sleep" state connections are most connection pointer waiting for the timeout to terminate. Then they still count as a connection. (Can cause MySQL connection limit error, which default equal 150 connections)

So next time, remember to close your connection before terminating your app.

> Every connection counts ;)
