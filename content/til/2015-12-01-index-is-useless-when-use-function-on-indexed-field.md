+++
date = "2015-12-01T00:00:01"
title = "#TIL : Index is useless when use function on indexed field"
description = "I learned on 2015-12-01 about index, sql, mysql"
categories = ["Today I learned", "mysql"]
tags = ["index", "sql", "mysql"]
+++



## Index is useless when use function on indexed field

Reality, if using function on indexed field, you will broke indexing by accident.
Eg:

```sql
WHERE MONTH(`date`) = 11 AND YEAR(`date`) = 2015
```

Solution is transform the query to comparison query, like this :

```sql
WHERE `date` >= '2015-11-01' AND `date` < '2015-12-01'
```
