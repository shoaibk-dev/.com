+++
date = "2018-05-17T23:59:59"
title = "#TIL : Encrypt and decrypt file using openssl command line"
description = "I learned in 2018-05-17 about decrypt, encrypt, crypto"
categories = ["Today I learned", "crypto"]
tags = ["decrypt", "encrypt", "crypto"]
+++



## Encrypt and decrypt file using openssl command line

You can encrypt and decrypt the file using openssl command line. Somehow you will need to encrypt your important file with a secret key.

**Encrypt**

```bash
openssl enc -aes-256-cbc -in [input_file] -out [output_file]
```

Then Enter 2 times your secret key (this should be hard to guess and don't loose it)

**Decrypt**

```bash
openssl enc -aes-256-cbc -d -in [input_file] > [output_file]
```

Then enter your secret key to decrypt the content !

*Notice : should use a 10-char length secret with alpha nums and special characters*
