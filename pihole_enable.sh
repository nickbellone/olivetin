#!/bin/bash

PIHOLE_URL="http://192.168.50.70/admin/api.php" #url of admin api
API_TOKEN="" #api token

# POST to enable
curl -s -X POST "${PIHOLE_URL}?enable&auth=${API_TOKEN}" \
     -H "Content-Length: 0"

echo "Pi-hole DNS has been renabled."