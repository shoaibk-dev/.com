---
title: "Build Sequel Pro from source in XCode 10"
date: 2018-09-30T10:59:25+07:00
description: "Sequel Pro is great GUI MySQL tool in macOS (it's open source and of course totally free)"
categories: ["mysql", "tool", "macos"]
tags: ["sequelpro", "mysql", "xcode", "database"]
image: "/images/2018/09/sequelpro.jpeg"
---

Sequel Pro is a great GUI MySQL tool in macOS (it's open source and of course totally FREE) !

But from last year, their automated build system has been broken, so their built versions are outdated :

- Stable version 1.1.2 (Apr 3, 2016)
- Nightly version 3477d22387 (Sep 6, 2017)

**UPDATED** : Nightly versions have been released from Oct 29, check it at [Test Builds](https://sequelpro.com/test-builds)

Even their codebase bas been updated every week but we can't use the latest build within a lot of bugfixes. So here is the guide to build SequelPro from source using XCode 10

**Step 1 : Clone source code**

```bash
$ git clone https://github.com/sequelpro/sequelpro.git --depth=1
$ cd sequelpro
```

**Step 2 : Change build config to Release**

```bash
$ sed -i '' -e 's/Debug/Release/g' Makefile
```

**Step 3 : Remove i386 (32 bits) from ARCHS environment variable**

```bash
$ find . -type f -name "*.pbxproj" -exec sed -i '' -e 's/ARCHS_STANDARD_32_64_BIT/ARCHS_STANDARD_64_BIT/g' {} +
```

**Step 4 : Build**

```bash
$ make
```

**Step 5 : Copy to Application folder**

```bash
$ cp -R build/Release/Sequel\ Pro.app /Applications/Sequel\ Pro.app
```

ENJOY !!! 😎
