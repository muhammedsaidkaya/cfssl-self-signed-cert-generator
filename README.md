
# CloudFlare Self-Signed Certificate Generator

## USAGE

```
docker run -it --rm uzumlukek/cfssl-cert bash
./provision.sh
./extract.sh
```

### Custom Config

```
docker run -it --rm -v ${PWD}/tls:/app/tls -v ${PWD}/secrets:/app/secrets  uzumlukek/cfssl-cert bash -c "./provision.sh"
docker run -it --rm -v ${PWD}/tls:/app/tls -v ${PWD}/secrets:/app/secrets  uzumlukek/cfssl-cert bash -c "./extract.sh"
```