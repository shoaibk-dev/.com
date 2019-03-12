+++
date = "2019-03-12T00:00:01"
title = "#TIL : Export MySQL data by specified query to CSV file"
description = "I learned on 2019-03-12 about cli, mysql"
categories = ["Today I learned", "mysql"]
tags = ["cli", "mysql"]
+++



## Export MySQL data by specified query to CSV file

To export data from MySQL by specified query to CSV file, you can use this command

```bash
$ mysql -B -u username -p database_name -h dbhost -e "SELECT * FROM table_name;" | sed "s/'/\'/;s/\t/\",\"/g;s/^/\"/;s/$/\"/;s/\n//g"
```

Tip from : https://stackoverflow.com/a/25427665
