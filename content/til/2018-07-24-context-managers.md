+++
date = "2018-07-24T23:59:59"
title = "#TIL : Context Managers"
description = "I learned on 2018-07-24 about python"
categories = ["Today I learned", "python"]
tags = ["python"]
+++



## Context Managers

In Python, sometimes you will see this syntax

```python
with something:
    do_something_else(something)
```

Then you ask yourself, why I have to use this `with` syntax ? What run inside that statement ?

Here is how it works, it's called **Context Managers** in object

You can define context managers for a class of object to make sure some logic runs correctly without forgeting

Example :

```python
class Animal:
    def __init__(self, name):
        self.name = name
    
    def __enter__(self):
        print("Enter the room !")
    
    def __exit__(self, exc_type, exc_value, traceback):
        print("Exit the room !")

kitty = Animal("Kitty Kat")
with kitty:
    print(kitty.name)
```

Result

```
Enter the room !
Kitty Kat
Exit the room !
```

So, when you start use `with` keyword on a object, it runs `__enter__` method, when everything inside `with` block are runned, `__exit__` will be called !

It's cool feature of Python !
