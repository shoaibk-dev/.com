+++
date = "2016-03-20T23:29:53+07:00"
title = "Read Input Data From USB Devices in Linux"
description = "You just bought a new input device like barcode scanner, proximity card reader with USB port. And you want expose only its data to file or send to server for processing ?"
categories = ["Python", "Linux"]
tags = ["linux", "python", "device", "english"]
image = "/images/2016/03/laser-barcode-scanners.jpg"
toc = true
+++

## Introduction

You just bought a new input device like barcode scanner, proximity card reader with USB port. And you want expose only its data to a file or send to server for processing ? But it acts like a keyboard, type the characters then trigger `Enter` key.

This tutorial can help you make a program can exclusive receive input data from the device and don't affect to another program.

The program is written in Python and can run on almost Linux system (Ubuntu desktop, Raspberry Pi, Arduino, etc..)

## Instruction

### Install dependencies

On a Debian compatible OS:
```shell
$ apt-get install python-dev python-pip gcc
$ apt-get install linux-headers-$(uname -r)
```

On a Redhat compatible OS:
```shell
$ yum install python-devel python-pip gcc
$ yum install kernel-headers-$(uname -r)
```

On Arch Linux and derivatives:
```shell
$ pacman -S core/linux-api-headers python-pip gcc
```

Then, install `evdev` package via `pip`
```shell
$ sudo pip install evdev
```

### Download program sourcecode

Copy this file and save as `main.py` 

```python
#!/usr/bin/python

import sys
from evdev import InputDevice, list_devices, ecodes, categorize

CODE_MAP_CHAR = {
    'KEY_MINUS': "-",
    'KEY_SPACE': " ",    
    'KEY_U': "U",
    'KEY_W': "W",
    'KEY_BACKSLASH': "\\",
    'KEY_GRAVE': "`",
    'KEY_NUMERIC_STAR': "*",
    'KEY_NUMERIC_3': "3",
    'KEY_NUMERIC_2': "2",
    'KEY_NUMERIC_5': "5",
    'KEY_NUMERIC_4': "4",
    'KEY_NUMERIC_7': "7",
    'KEY_NUMERIC_6': "6",
    'KEY_NUMERIC_9': "9",
    'KEY_NUMERIC_8': "8",
    'KEY_NUMERIC_1': "1",
    'KEY_NUMERIC_0': "0",
    'KEY_E': "E",
    'KEY_D': "D",
    'KEY_G': "G",
    'KEY_F': "F",
    'KEY_A': "A",
    'KEY_C': "C",
    'KEY_B': "B",
    'KEY_M': "M",
    'KEY_L': "L",
    'KEY_O': "O",
    'KEY_N': "N",
    'KEY_I': "I",
    'KEY_H': "H",
    'KEY_K': "K",
    'KEY_J': "J",
    'KEY_Q': "Q",
    'KEY_P': "P",
    'KEY_S': "S",
    'KEY_X': "X",
    'KEY_Z': "Z",
    'KEY_KP4': "4",
    'KEY_KP5': "5",
    'KEY_KP6': "6",
    'KEY_KP7': "7",
    'KEY_KP0': "0",
    'KEY_KP1': "1",
    'KEY_KP2': "2",
    'KEY_KP3': "3",
    'KEY_KP8': "8",
    'KEY_KP9': "9",
    'KEY_5': "5",
    'KEY_4': "4",
    'KEY_7': "7",
    'KEY_6': "6",
    'KEY_1': "1",
    'KEY_0': "0",
    'KEY_3': "3",
    'KEY_2': "2",
    'KEY_9': "9",
    'KEY_8': "8",
    'KEY_LEFTBRACE': "[",
    'KEY_RIGHTBRACE': "]",    
    'KEY_COMMA': ",",
    'KEY_EQUAL': "=",    
    'KEY_SEMICOLON': ";",
    'KEY_APOSTROPHE': "'",
    'KEY_T': "T",
    'KEY_V': "V",
    'KEY_R': "R",
    'KEY_Y': "Y",
    'KEY_TAB': "\t",
    'KEY_DOT': ".",
    'KEY_SLASH': "/",
}

def parse_key_to_char(val):
    return CODE_MAP_CHAR[val] if val in CODE_MAP_CHAR else ""

if __name__ == "__main__":
    print "List of your devices :"
    devices = [InputDevice(fn) for fn in list_devices()]
    for device in devices:
        print "\t{}\t{}".format(device.fn, device.name)
        
    print "Choose event ID :",
    event_id = raw_input()
    
    print "Exclusive access to device ? [1 or 0] : ",
    exclusive_access = raw_input()
    
    device = InputDevice('/dev/input/event{}'.format(event_id))
    if int(exclusive_access) == 1:
        device.grab()

    for event in device.read_loop():
        if event.type == ecodes.EV_KEY:
            e = categorize(event)
            if e.keystate == e.key_up:
                sys.stdout.write(parse_key_to_char(e.keycode))
                sys.stdout.flush()
```

### Run program with root permission

```shell
$ sudo python main.py
```

Then enter your event id of device based on device name in devices list. If you want exclusive access to that device (means no application can't access and read the input data), press `1` or `0` to accept or deny.

This is my result, I opened the `gedit` and typed a paragragh but no character appears in Editor, but they're shown in the terminal.

![Read device input on Linux](/images/2016/03/read_device_linux.png)

## Customize output data

You can rewrite the code to send data to web server

```shell
$ sudo pip install requests
```

```python
#!/usr/bin/python

import sys
import requests
from evdev import InputDevice, list_devices, ecodes, categorize

CODE_MAP_CHAR = {
    'KEY_MINUS': "-",
    'KEY_SPACE': " ",    
    'KEY_U': "U",
    'KEY_W': "W",
    'KEY_BACKSLASH': "\\",
    'KEY_GRAVE': "`",
    'KEY_NUMERIC_STAR': "*",
    'KEY_NUMERIC_3': "3",
    'KEY_NUMERIC_2': "2",
    'KEY_NUMERIC_5': "5",
    'KEY_NUMERIC_4': "4",
    'KEY_NUMERIC_7': "7",
    'KEY_NUMERIC_6': "6",
    'KEY_NUMERIC_9': "9",
    'KEY_NUMERIC_8': "8",
    'KEY_NUMERIC_1': "1",
    'KEY_NUMERIC_0': "0",
    'KEY_E': "E",
    'KEY_D': "D",
    'KEY_G': "G",
    'KEY_F': "F",
    'KEY_A': "A",
    'KEY_C': "C",
    'KEY_B': "B",
    'KEY_M': "M",
    'KEY_L': "L",
    'KEY_O': "O",
    'KEY_N': "N",
    'KEY_I': "I",
    'KEY_H': "H",
    'KEY_K': "K",
    'KEY_J': "J",
    'KEY_Q': "Q",
    'KEY_P': "P",
    'KEY_S': "S",
    'KEY_X': "X",
    'KEY_Z': "Z",
    'KEY_KP4': "4",
    'KEY_KP5': "5",
    'KEY_KP6': "6",
    'KEY_KP7': "7",
    'KEY_KP0': "0",
    'KEY_KP1': "1",
    'KEY_KP2': "2",
    'KEY_KP3': "3",
    'KEY_KP8': "8",
    'KEY_KP9': "9",
    'KEY_5': "5",
    'KEY_4': "4",
    'KEY_7': "7",
    'KEY_6': "6",
    'KEY_1': "1",
    'KEY_0': "0",
    'KEY_3': "3",
    'KEY_2': "2",
    'KEY_9': "9",
    'KEY_8': "8",
    'KEY_LEFTBRACE': "[",
    'KEY_RIGHTBRACE': "]",    
    'KEY_COMMA': ",",
    'KEY_EQUAL': "=",    
    'KEY_SEMICOLON': ";",
    'KEY_APOSTROPHE': "'",
    'KEY_T': "T",
    'KEY_V': "V",
    'KEY_R': "R",
    'KEY_Y': "Y",
    'KEY_TAB': "\t",
    'KEY_DOT': ".",
    'KEY_SLASH': "/",
}

def parse_key_to_char(val):
    return CODE_MAP_CHAR[val] if val in CODE_MAP_CHAR else ""

if __name__ == "__main__":
    print "List of your devices :"
    devices = [InputDevice(fn) for fn in list_devices()]
    for device in devices:
        print "\t{}\t{}".format(device.fn, device.name)
        
    print "Choose event ID :",
    event_id = raw_input()
    
    print "Exclusive access to device ? [1 or 0] : ",
    exclusive_access = raw_input()
    
    device = InputDevice('/dev/input/event{}'.format(event_id))
    if int(exclusive_access) == 1:
        device.grab()
    
    data = ""
    for event in device.read_loop():
        if event.type == ecodes.EV_KEY:
            e = categorize(event)
            if e.keystate == e.key_up:
                if e.keycode == "KEY_ENTER":
                    requests.post("https://somewhere/code/belongs", {
                        code: data
                    })
                    data = ""
                else:
                    data += parse_key_to_char(e.keycode)
```

> You can read more about **evdev** API [here](https://python-evdev.readthedocs.org/en/latest/index.html)

**Ref :**

- cover photo from [blog.pepperl-fuchs.us](http://blog.pepperl-fuchs.us/boosting-productivity-with-the-help-of-laser-barcode-scanners)