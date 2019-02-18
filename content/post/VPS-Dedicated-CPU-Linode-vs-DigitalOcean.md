---
title: "VPS Dedicated CPU showdown : Linode vs DigitalOcean"
date: 2019-02-18T11:48:53+07:00
image: "/images/2019/02/linode-vs-digitalocean.png"
tags: ["vps", "linode", "digitalocean", "benchmark"]
comments: true
---

This Feb, Linode releases new plans (Dedicated CPU VPS plans, which means the CPUs run on KVM host without sharing to other neighbors). So I make this benchmark to show how good it is compared with DigitalOcean (DO) in the same plan.

## Price

> **Linode's price has 25% lower than DO's.**

### Linode price

![linode dedicated cpu price](/images/2019/02/linode-pricing.png)

### DigitalOcean price

![digitalocean dedicated cpu price](/images/2019/02/do-pricing.png)

## Boot time

Linode VPS boots a bit slower than DO. (115 processes vs 96 processes)

## Benchmark

I used this script (https://github.com/n-st/nench) to benchmark the minimum plan (2 vCPUs and 4GB RAM). I configured `vm.swappiness = 0` to disable swap.

### Linode

```
Processor:    Intel(R) Xeon(R) CPU E5-2680 v3 @ 2.50GHz
CPU cores:    2
Frequency:    2499.984 MHz
RAM:          3.9G
Swap:         511M
Kernel:       Linux 4.15.0-43-generic x86_64

Disks:
sda   24.5G  HDD
sdb    512M  HDD

CPU: SHA256-hashing 500 MB
    3.339 seconds
CPU: bzip2-compressing 500 MB
    5.649 seconds
CPU: AES-encrypting 500 MB
    1.535 seconds

ioping: seek rate
    min/avg/max/mdev = 60.1 us / 87.6 us / 8.98 ms / 104.1 us
ioping: sequential read speed
    generated 25.2 k requests in 5.00 s, 6.15 GiB, 5.04 k iops, 1.23 GiB/s

dd: sequential write speed
    1st run:    953.67 MiB/s
    2nd run:    1239.78 MiB/s
    3rd run:    1144.41 MiB/s
    average:    1112.62 MiB/s

IPv4 speedtests
    your IPv4:    139.162.5.xxxx

    Cachefly CDN:         54.08 MiB/s
    Leaseweb (NL):        6.64 MiB/s
    Softlayer DAL (US):   3.18 MiB/s
    Online.net (FR):      1.74 MiB/s
    OVH BHS (CA):         0.29 MiB/s

IPv6 speedtests
    your IPv6:    2400:8901::xxxx

    Leaseweb (NL):        5.60 MiB/s
    Softlayer DAL (US):   0.00 MiB/s
    Online.net (FR):      10.43 MiB/s
    OVH BHS (CA):         0.85 MiB/s
-------------------------------------------------
```

### Digital Ocean

```
Processor:    Intel(R) Xeon(R) Platinum 8168 CPU @ 2.70GHz
CPU cores:    2
Frequency:    2693.670 MHz
RAM:          3.9G
Swap:         -
Kernel:       Linux 4.15.0-45-generic x86_64

Disks:
vda     25G  HDD

CPU: SHA256-hashing 500 MB
    2.427 seconds
CPU: bzip2-compressing 500 MB
    4.252 seconds
CPU: AES-encrypting 500 MB
    0.964 seconds

ioping: seek rate
    min/avg/max/mdev = 114.8 us / 185.5 us / 4.33 ms / 48.3 us
ioping: sequential read speed
    generated 4.13 k requests in 5.00 s, 1.01 GiB, 826 iops, 206.6 MiB/s

dd: sequential write speed
    1st run:    410.08 MiB/s
    2nd run:    386.24 MiB/s
    3rd run:    417.71 MiB/s
    average:    404.68 MiB/s

IPv4 speedtests
    your IPv4:    178.128.214.xxxx

    Cachefly CDN:         13.14 MiB/s
    Leaseweb (NL):        13.56 MiB/s
    Softlayer DAL (US):   7.82 MiB/s
    Online.net (FR):      9.86 MiB/s
    OVH BHS (CA):         0.44 MiB/s

IPv6 speedtests
    your IPv6:    2400:6180:0:xxxx

    Leaseweb (NL):        9.57 MiB/s
    Softlayer DAL (US):   0.00 MiB/s
    Online.net (FR):      4.95 MiB/s
    OVH BHS (CA):         0.30 MiB/s
-------------------------------------------------
```

## Conclusion

DigitalOcean allows you run on newer hardwares so its CPU is better than Linode's. (You can compare the result in CPU hashing section). By the way, Linode has the better price so it's your choices! :)

Hope Linode will upgrade the hardwares soon.
