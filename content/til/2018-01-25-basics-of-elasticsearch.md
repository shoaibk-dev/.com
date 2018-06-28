+++
date = "2018-01-25T23:59:59"
title = "#TIL : Basics of Elasticsearch"
description = "I learned on 2018-01-25 about logging, elasticsearch, system"
categories = ["Today I learned", "elasticsearch"]
tags = ["logging", "elasticsearch", "system"]
+++



## Basics of Elasticsearch

Last days, I developed a EFK stack to centralize my system logging. I really like the concepts of FluentD, it's better than original stack ELK of elastic company.

So I need to learn basics about Elasticsearch and Kibana

This is what I learned :

```http
# Get all documents from elasticsearch node
GET _search
{
  "query": {
    "match_all": {}
  }
}

# Check nodes statistics
GET /_nodes/stats

# Check health of cluster (I don't know why it is always yello status)
GET _cluster/health

# Get list of indices (indexes)
GET /_cat/indices?v

# Delete a index (with its data) with name
DELETE /[index-name]
```
