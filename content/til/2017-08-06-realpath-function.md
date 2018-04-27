+++
date = "2017-08-06T23:59:59"
title = "#TIL 2017-08-06 : realpath function"
description = "I learned in 2017-08-06 about php, mistake"
categories = ["Today I learned", "php"]
tags = ["php", "mistake"]
+++



## realpath function

If you pass a non-exists path to function `realpath`, it returns empty string. So please don't do something like :

```php
function storage_path($folder) {
	return realpath(__DIR__.'/storage/'.$folder);
}
```

if you expect it return full path of new folder !