---
title: "Reading NFC Card ID on Ubuntu"
date: 2017-09-27T17:00:00+07:00
description: "You just bought a new NFC card reader with USB port. And you want expose only its data to file or send to server for processing ?"
categories: ["Python", "Linux"]
tags: ["linux", "python", "device", "nfc", "english"]
image: "2017/09/NFC-technology-business-cards.jpg"
toc: true
---

## Prerequisites

### Install driver

My device is [ACS122U](https://www.acs.com.hk/en/products/3/acr122u-usb-nfc-reader) : http://www.acs.com.hk/en/products/3/acr122u-usb-nfc-reader/#tab_downloads

### Kernel modules

```bash
# echo "uinput" >> /etc/modules
# echo "install nfc /bin/false" >> /etc/modprobe.d/blacklist.conf
# echo "install pn533 /bin/false" >> /etc/modprobe.d/blacklist.conf
```

### Install packages

```bash
sudo apt-get install swig libccid pcscd libpcsclite-dev libpcsclite1 python-dev python-pip gcc linux-headers-$(uname -r)
```

### Run service

```bash
sudo service pcscd restart
```

### Install python packages

```bash
sudo pip install pyscard python-uinput evdev
```

## Source code

This is source code that read the card ID and simulate keystrokes to type card ID by text then pressing ENTER key.

```python
#! /usr/bin/env python

from __future__ import print_function
from time import sleep

from smartcard.CardConnectionObserver import ConsoleCardConnectionObserver
from smartcard.CardMonitoring import CardMonitor, CardObserver
from smartcard.util import toHexString
from evdev import UInput, ecodes
import uinput


device = uinput.Device([uinput.KEY_0, uinput.KEY_1, uinput.KEY_2, uinput.KEY_3, uinput.KEY_4, uinput.KEY_5, uinput.KEY_6, uinput.KEY_7, uinput.KEY_8, uinput.KEY_9, uinput.KEY_A, uinput.KEY_B, uinput.KEY_C, uinput.KEY_D, uinput.KEY_E, uinput.KEY_F, uinput.KEY_G, uinput.KEY_H, uinput.KEY_I, uinput.KEY_J, uinput.KEY_K, uinput.KEY_L, uinput.KEY_M, uinput.KEY_N, uinput.KEY_O, uinput.KEY_P, uinput.KEY_Q, uinput.KEY_R, uinput.KEY_S, uinput.KEY_T, uinput.KEY_U, uinput.KEY_V, uinput.KEY_W, uinput.KEY_X, uinput.KEY_Y, uinput.KEY_Z, uinput.KEY_TAB])


def card_id_to_keyboards(card_id):
    id = card_id.replace(' ', '')

    return [getattr(uinput, 'KEY_'+x.upper()) for x in id]


# a simple card observer that tries to select DF_TELECOM on an inserted card
class selectDFTELECOMObserver(CardObserver):
    """A simple card observer that is notified
    when cards are inserted/removed from the system and
    prints the list of cards
    """

    def __init__(self):
        self.observer = ConsoleCardConnectionObserver()

    def update(self, observable, actions):
        try:
            (addedcards, removedcards) = actions
            for card in addedcards:
                print("+Inserted: ", toHexString(card.atr))
                card.connection = card.createConnection()
                card.connection.connect()
                card.connection.addObserver(self.observer)
                apdu = [0xFF, 0xCA, 0x00, 0x00, 0x00]
                response, sw1, sw2 = card.connection.transmit(apdu)
                keys = card_id_to_keyboards(toHexString(response))
                for key in keys:
                    device.emit_click(key)
                ui = UInput()
                ui.write(ecodes.EV_KEY, ecodes.KEY_ENTER, 0)
                ui.write(ecodes.EV_KEY, ecodes.KEY_ENTER, 1)
                ui.syn()
                ui.close()
            for card in removedcards:
                print("-Removed: ", toHexString(card.atr))
        except:
            pass

if __name__ == '__main__':
    print("Insert or remove a SIM card in the system.")
    print("This program will exit in 60 seconds")
    print("")
    cardmonitor = CardMonitor()
    selectobserver = selectDFTELECOMObserver()
    cardmonitor.addObserver(selectobserver)

    sleep(86400)

    # don't forget to remove observer, or the
    # monitor will poll forever...
    cardmonitor.deleteObserver(selectobserver)

    import sys
    if 'win32' == sys.platform:
        print('press Enter to continue')
        sys.stdin.read(1)
```

## Run

```bash
$ sudo python main.py
```

## Demo

This is my demo application that using card ID like a user password, so I can unlock my computer or enter sudo mode :D

{{< youtube PAOxEXvbvAY >}}

### It Just Works

If you want a "just-work" solution, checkout this [repo](https://github.com/inventid/rfid-reader2keyboard). It is built on Java smartcardio.

```bash
$ java -jar rfid-reader2keyboard.jar
```

Good luck ! ;)
