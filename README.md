Quick docker to gather LE certs via https://github.com/lukas2511/letsencrypt.sh
```
docker run -it -v /srv/docker/volumes/letsencrypt/webroot/:/var/lib/letsencrypt-webroot/ -e CA="https://acme-staging.api.letsencrypt.org/directory"  -e WELLKNOWN=/var/lib/letsencrypt-webroot/.well-known/acme-challenge -e COMMON_NAMES="demo.example.net" jbonachera/letsencrypt /bin/bash
```
$WELLKNOWN folder has to be served via another docker (via a volume cross-mount for example)
