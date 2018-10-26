+++
date = "2015-12-04T14:36:10+07:00"
title = "PHP 5.6 vs PHP 7RC8 - Benchmarking using Docker"
description = "New version of PHP, PHP7 has been released yesterday after 11 years of PHP5. I am very excited with it, so I made a benchmark to compare the performance of 2 versions."
categories = ["PHP", "Docker"]
tags = ["php", "docker", "benchmarking", "sifoni", "english"]
image = "/images/2015/12/php7.jpg"
toc = false
+++

New version of PHP, PHP7 has been released yesterday after 11 years of PHP5. I am very excited with it, so I made a benchmark to compare the performance of 2 versions.

The fastest way to test out PHP multi-versions is using Docker image. You can get it from : https://hub.docker.com/_/php/

### Let's start pull PHP images

```shell
docker pull php:5.6
docker pull php:7
```

Change directory to the web root folder of PHP project (I used my micro-framework, [Sifoni](https://github.com/ndksolution/sifoni-framework) to test). And add this file `server.php` to web folder with content

```php
<?php

error_reporting(0);

$filename = __DIR__.preg_replace('#(\?.*)$#', '', $_SERVER['REQUEST_URI']);
if (php_sapi_name() === 'cli-server' && is_file($filename)) {
    return false;
}

define('ROOT_PATH', dirname(dirname(__FILE__)));

$autoloader = require_once (ROOT_PATH . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php');

\Sifoni\Engine::getInstance()->init()->bootstrap(array(
    'path.root' => ROOT_PATH,
    'autoloader' => $autoloader,
))->start()->run();
```

### Next, run this command to run with PHP 5.6

```shell
docker run -it -p 8080:8080 -v `pwd`:/code php:5.6 php -S 0.0.0.0:8080 -t /code/web /code/web/server.php
```

Open `http://localhost:8080/` to see the memory and processing time of PHP5.6.

### Continue with PHP7, exit the PHP 5.6 session and run this command

```shell
docker run -it -p 8080:8080 -v `pwd`:/code php:7 php -S 0.0.0.0:8080 -t /code/web /code/web/server.php
```

Open `http://localhost:8080/` to see the memory and processing time PHP7.

This is my result :

![PHP 5.6 benchmarking result](/images/2015/12/benchmarking_php5_6.png)

![PHP PHP 7 RC8 benchmarking result](/images/2015/12/benchmarking_php7.png)

**Amazing... PHP 7 is winner in Saving Memory and Processesing Time (about 1.4x times than PHP 5.6).**

> At the moment I tested, official docker image of PHP is PHP7RC8. Hope image maintainer updates it soon :)
