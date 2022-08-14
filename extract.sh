#!/bin/bash

openssl x509 -noout -subject -in secrets/client.pem -enddate 
