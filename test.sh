#!/bin/bash

openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048

openssl req -new -key private_key.pem -out request.csr

openssl req -x509 -key private_key.pem -in request.csr -out certificate.pem -days 365

openssl req -x509 -key private_key.pem -in request.csr -out certificate.pem -days 365

openssl ocsp -issuer certificate.pem -serial <serial_number> -reqout ocsp_request.der

openssl x509 -in certificate.pem -noout -serial | awk -F= '{print $2}'

