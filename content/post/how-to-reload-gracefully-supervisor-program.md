+++
date = "2017-03-25T13:59:26+07:00"
title = "How to reload gracefully supervisor program"
description = "It’s creepy when supervisor kills all processes of programs and starts them again."
categories = ["System", "Tech"]
tags = ["system", "supervisor", "devops", "ansible", "php"]
toc = true

+++

## Problem

We have some managed worker-programs by [supervisor](http://supervisord.org/index.html). While deploying new codebase of worker, we have to restart them to update new logic.

But it's creepy when supervisor kills all processes of programs and starts again.

**WHAT IF IT KILLS A WORKING WORKER ?**

Of course, the working task will be fucked up. Database transaction, database migration, sending email and other scheduled tasks will be **crashed in middle**. Some tasks can't not be reserved, rollbacked or re-runned.

> And your customer can't trust in you twice.

## Generic Solution

In movie, people want to do last thing (say last words, have last kiss or even enjoy last song) then kill themself. So computer programs should have that favour, let them finishes their tasks and kill themself instead of being shooted by a UNIX signal.

![Keep calm](/images/2017/03/blowing-ship.gif)

## Mutex lock file mechanism

Get back to think, the main roles of supervisor are monitoring and controlling a number of processes on UNIX-like OS. Easier explaination : supervisor tracks processes and tries to re-init them if they were crashed in somehow.

So if you want to reload a program, just let it kills itself. Then supervisor do the remain job (re-init processes).

### Pseudo implementation

Worker code

```
function doSomeJob() {
    // Create a lock file to notify it's doing task so don't shoot it
    touch_file('/tmp/somejob.lock')
    // Doing task
    do_it_here()
    // Checking lockfile
    if (is_file_exists('/tmp/somejob.lock')) {
        remove_file('/tmp/somejob.lock')
    } else {
        kill_myself()
    }
}
```

Deploying code

```bash
[[ -e /tmp/somejob.lock ]] && rm /tmp/somejob.lock || supervisor restart program1
```

### PHP worker and Ansible

Worker code

```php
function doSomeTask() {
    touch('/tmp/somejob.lock');
    // Doing task
    do_it_here();
    // Checking lockfile
    if (file_exists('/tmp/somejob.lock')) {
        unlink('/tmp/somejob.lock');
    } else {
        exit();
    }
}
```

Ansible tasks

```
- name: Check if woker lock file exists
  stat: path=/tmp/somejob.lock
  register: check_worker_lock

- name: Remove if worker lock file exists
  file:
    path: /tmp/somejob.lock
    state: absent
  when: check_worker_lock.stat.exists
```

Ansible handlers

```
- name: reload supervisor
  supervisorctl:
    name: worker
    state: restarted
  when: check_worker_lock.stat.exists == False
```

## Short explanation by image

![bazooka fail kid](/images/2017/03/water-bazooka-rocket-kid-face.gif)

---------------------------

**Ref:**

- Meme from Google photo search
