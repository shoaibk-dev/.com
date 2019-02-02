+++
date = "2015-12-01T00:00:01"
title = "#TIL : String Format Unicode params"
description = "I learned on 2015-12-01 about python, string, unicode"
categories = ["Today I learned", "python"]
tags = ["python", "string", "unicode"]
+++



## String Format Unicode params

```python
unicode_thing = u"Xin chào mọi người"
a = '{}'.format(unicode_thing)
```
will cause the error `UnicodeEncodeError: 'ascii' codec can't encode character u'\xe0' in position 6: ordinal not in range(128)`

The solution is add `u` prefix the pattern (it means using unicode pattern) :

```python
unicode_thing = u"Xin chào mọi người"
a = u'{}'.format(unicode_thing)
```
