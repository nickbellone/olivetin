#!/bin/bash

PIHOLE_URL="IPADDR/admin/api.php"
API_TOKEN=""

# POST to enable
curl -s -X POST "${PIHOLE_URL}?enable&auth=${API_TOKEN}" \
     -H "Content-Length: 0"

echo "Pi-hole DNS has been renabled."