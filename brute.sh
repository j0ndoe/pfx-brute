#!/bin/bash
cat ~/wordlists/rockyou.txt|
while read p; do
    echo trying $p;
    openssl pkcs12 -in "cert.pfx"  -passin "pass:$p" -nocerts -nodes -out key.pem;
    RC=$?; if [ $RC -eq 0 ]; then
break; fi ; done
