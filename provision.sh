#!/bin/bash

#generate ca in /work/ca
cfssl gencert -initca ./tls/ca-csr.json | cfssljson -bare ./secrets/ca

#generate certificate in /work/client
cfssl gencert \
  -ca=./secrets/ca.pem \
  -ca-key=./secrets/ca-key.pem \
  -config=./tls/ca-config.json \
  -profile=default \
  ./tls/ca-csr.json | cfssljson -bare ./secrets/client

#make a secret
cat <<EOF > ./secrets/tls-self-signed-cert.yaml
apiVersion: v1
kind: Secret
metadata:
  name: tls-self-signed-cert
type: Opaque
data:
  tls.crt: $(cat ./secrets/client.pem | base64 | tr -d '\n')
  tls.key: $(cat ./secrets/client-key.pem | base64 | tr -d '\n')
EOF