
# CloudFlare Self-Signed Certificate Generator

## USAGE

```
docker run -it --rm uzumlukek/cfssl-cert bash
./provision.sh
./extract.sh
```

### Custom Config

```
#!/bin/bash

mkdir -p tls

cat <<EOF > tls/ca-csr.json
{
    "hosts": [
      "example.com"
    ],
    "key": {
      "algo": "rsa",
      "size": 2048
    },
    "names": [
      {
        "C": "US",
        "L": "San Francisco",
        "O": "Example",
        "OU": "DevOps",
        "ST": "California"
      }
    ]
}
EOF

cat <<EOF > tls/ca-config.json
{
    "signing": {
      "default": {
        "expiry": "175200h"
      },
      "profiles": {
        "default": {
          "usages": ["signing", "key encipherment", "server auth", "client auth"],
          "expiry": "175200h"
        }
      }
    }
}
EOF

docker run -it --rm -v ${PWD}/tls:/app/tls/ -v ${PWD}/secrets:/app/secrets  uzumlukek/cfssl-cert bash -c "./provision.sh"
docker run -it --rm -v ${PWD}/tls:/app/tls/ -v ${PWD}/secrets:/app/secrets  uzumlukek/cfssl-cert bash -c "./extract.sh"
```