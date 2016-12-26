#!/usr/bin/env bash

#
# Example how to deploy a DNS challenge using nsupdate
#

set -e
set -u
set -o pipefail

NSUPDATE="nsupdate"
# Env vars
#DNSSERVER
#ZONE=$ZONE
#KEY_ALG
#KEY_NAME
#KEY
TTL=0
ZONE=$(echo ${2} | rev | cut -d '.' -f 2,1 | rev)
echo "Targeting zone $ZONE"
case "$1" in
    "deploy_challenge")
        printf "key $KEY_ALG:$KEY_NAME $KEY\nserver %s\nzone %s.\nupdate add _acme-challenge.%s. %d in TXT \"%s\"\nsend\n" "${DNSSERVER}" "${ZONE}" "${2}" "${TTL}" "${4}" | $NSUPDATE
        ;;
    "clean_challenge")
        printf "key $KEY_ALG:$KEY_NAME $KEY\nserver %s\nzone %s.\nupdate delete _acme-challenge.%s. %d in TXT \"%s\"\nsend\n" "${DNSSERVER}" "${ZONE}" "${2}" "${TTL}" "${4}" | $NSUPDATE
        ;;
    "deploy_cert")
        # do nothing for now
        ;;
    "unchanged_cert")
        # do nothing for now
        ;;
    *)
        echo Unknown hook "${1}"
        exit 1
        ;;
esac

exit 0
