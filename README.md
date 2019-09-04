Docker Setup
---

## Requisites

- docker
- docker-compose

## Verify

Verify development network

```bash
# Check if not exist
docker network ls | grep development
# Create network
docker network create --driver=bridge --subnet=172.20.0.0/16 --gateway=172.20.0.1 development
```

### Allow access from another networks segment to containers development network

```bash
# Connect another network in each container and use name over ip
docker network connect <network-name> db
docker network connect <network-name> cache
```

### Deploy

Deploy Apache Server with PHP 7.3 (apache73)

```bash
docker-compose up -d
```

### SSL Certificate in Windows

See: (https://curl.haxx.se/docs/sslcerts.html)[https://curl.haxx.se/docs/sslcerts.html]

0. Add in: C:C:\Windows\System32\drivers\etc\hosts

```
127.0.0.1       analitica.local
::1             analitica.local
```

1. Download certificate package from: https://curl.haxx.se/docs/caextract.html (save as: `curl-ca-bundle.crt`)

2. Run in cmd (or sh with Git) command:

```bash
openssl s_client -showcerts -servername server -connect analitica.local:443 > analitica.local.pem
```

3. Concat `analitica.local.pem` chain certificates in `curl-ca-bundle.crt` file.

4. Move file curl-ca-bundle.crt concatenated to:

```bash
C:/Windows/System32/curl-ca-bundle.crt
```

5. Run in cmd to test (a URL valid), for example:

```bash
curl -I https://analitica.local
```

It must be return: 302 | 200 HTTP Code
