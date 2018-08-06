+++
date = "2018-08-06T23:59:59"
title = "#TIL : Internal Variables in BASH"
description = "I learned on 2018-08-06 about shell, bash"
categories = ["Today I learned", "bash"]
tags = ["shell", "bash"]
+++



## Internal Variables in BASH

### $PWD

Your current working directory, so you don't have to use `CWD=$(pwd)`

### $OLDPWD

Your previous working directory

**Note** : You can jump directly to it by the command `cd -`

### $SECONDS

The number of seconds the script has been running

You can use it for profiling or limiting timeout

```bash
TIME_LIMIT=60

while [ "$SECONDS" -le "$TIME_LIMIT" ]
do
	## Your hard work here
done

echo "It takes $SECONDS seconds to get here !"
```

### $RANDOM

Get random integer number, for getting random name or just roll a dice ;)

![lucky boy](https://user-images.githubusercontent.com/4528223/43698047-23d567d6-9972-11e8-8208-f980cd804c1f.jpg)
