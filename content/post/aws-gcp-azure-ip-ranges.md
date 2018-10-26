---
title: "Getting AWS, GCP and Azure IP ranges"
date: 2017-11-13T16:31:08+07:00
description: "Get list IP ranges of cloud providers"
categories: ["sysadmin", cloud"]
tags: ["sysadmin", "cloud", "ip", "english"]
image: "/images/2017/11/ip-address.jpg"
toc: true
---

## TL;DR

This is my gist of result

https://gist.github.com/khanhicetea/c6cc74b99ab336d58c2da7929c2de709

## Introdution

These are 3 biggest cloud providers (from Amazon, Google and Microsoft). This is the way to get their IP ranges (IPv4).

## Amazon Web Service

AWS update its IP ranges on this link : https://ip-ranges.amazonaws.com/ip-ranges.json

```bash
# download ip-ranges.json file
curl -o aws.json https://ip-ranges.amazonaws.com/ip-ranges.json
# parse ip range with grep tool
grep -o -E '\d+\.\d+\.\d+\.\d+/\d+' aws.json > aws.txt
```

The result are in `aws.txt` file.

## Google Cloud Platform

This script from [LinuxFreelancer article](https://linuxfreelancer.com/cloud-service-providers-ip-ranges-aws-azure-and-gcp)

```bash
# array to hold list of IP blocks
ALL_IPS=()
NAME_SERVER='8.8.8.8'
txt_records=$(dig @${NAME_SERVER} _cloud-netblocks.googleusercontent.com txt +short)
txt_rr_only=$(echo $txt_records | grep -oP 'include:\S+' | sed 's/include://g')
[[ -z ${txt_rr_only} ]] && { echo 'No TXT dns record found.'; exit 1;}
## unpack txt records to get IPv4 ranges
for rr in ${txt_rr_only}; do
  new_ips=$(dig @${NAME_SERVER} $rr txt +short | grep -o -P '(\d+\.){3}\d+/\d+')
  for item in ${new_ips}; do
    # add space separator between ip blocks
    item=" ${item} "
    ALL_IPS+=${item}
  done
done
 
# sort IPs then output result file
echo ${ALL_IPS[@]} | sed 's/ /\n/g' | sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 > gcp.txt
```

## Microsoft Azure

This script download the file updated at Nov 06 2017, the latest file is here : https://www.microsoft.com/en-us/download/details.aspx?id=41653

```bash
# download ip-ranges.json file
curl -o azure.xml https://download.microsoft.com/download/0/1/8/018E208D-54F8-44CD-AA26-CD7BC9524A8C/PublicIPs_20171106.xml
# parse ip range with grep tool
grep -o -E '\d+\.\d+\.\d+\.\d+/\d+' azure.xml > azure.txt
```

## Play it all !

```bash
#!/bin/bash

# AWS
curl -o aws.json https://ip-ranges.amazonaws.com/ip-ranges.json
grep -oP '\d+\.\d+\.\d+\.\d+/\d+' aws.json > aws.txt
rm -f aws.json

# GCP
ALL_IPS=()
NAME_SERVER='8.8.8.8'
txt_records=$(dig @${NAME_SERVER} _cloud-netblocks.googleusercontent.com txt +short)
txt_rr_only=$(echo $txt_records | grep -oP 'include:\S+' | sed 's/include://g')
[[ -z ${txt_rr_only} ]] && { echo 'No TXT dns record found.'; exit 1;}
for rr in ${txt_rr_only}; do
  new_ips=$(dig @${NAME_SERVER} $rr txt +short | grep -o -P '(\d+\.){3}\d+/\d+')
  for item in ${new_ips}; do
    item=" ${item} "
    ALL_IPS+=${item}
  done
done
 
# sort IPs then output result file
echo ${ALL_IPS[@]} | sed 's/ /\n/g' | sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 > gcp.txt

# Azure
curl -o azure.xml https://download.microsoft.com/download/0/1/8/018E208D-54F8-44CD-AA26-CD7BC9524A8C/PublicIPs_20171106.xml
grep -oP '\d+\.\d+\.\d+\.\d+/\d+' azure.xml > azure.txt
rm -f azure.xml
```

## MacOS issue

If you're running this script on MacOS, try to replace `grep -P` to `grep -E`

## Use Cases ???

This list is very useful for some usecases, I will post them later ;)

