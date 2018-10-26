+++
date = "2018-04-30T23:59:59"
title = "#TIL : Exporting environment variables on virtual env activate"
description = "I learned on 2018-04-30 about python"
categories = ["Today I learned", "python"]
tags = ["python"]
image = "/images/never_stop_learning.jpg"
comments = true
+++



## Exporting environment variables on virtual env activate

You can put common environment variables to the file `venv/bin/activate`. So everytime we active the virtual env, everything is on the way

```bash
# venv/bin/active content

# export your env vars here
export FLASK_APP=hello
export FLASK_ENV=development
export DATABASE=hello.sqlite3
export SECRET_KEY=secret_key_here
```
