#!/bin/bash

PIHOLE_URL="IPADDR/admin/api.php"
API_TOKEN=""

# Duration to disable in seconds. By default this is indefinite.
#DISABLE_DURATION=300

# Send POST request to disable Pi-hole
curl -s -X POST "${PIHOLE_URL}?disable&auth=${API_TOKEN}" \
     -H "Content-Length: 0"

echo "Pi-hole DNS has been disabled."