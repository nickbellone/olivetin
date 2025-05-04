#!/bin/bash

PIHOLE_HOST=""  # IP
PASSWORD=""      

auth_and_enable() {
    auth_response=$(curl -s -X POST "${PIHOLE_HOST}/api/auth" \
        -H "Content-Type: application/json" \
        -d '{"password":"'"${PASSWORD}"'"}')

    if ! echo "$auth_response" | grep -q '"valid":true'; then
        echo "Authentication Failed"
        echo "Response: $auth_response"
        exit 1
    fi

    sid=$(echo "$auth_response" | grep -oP '(?<="sid":")[^"]*')

    response=$(curl -s -X POST "${PIHOLE_HOST}/api/dns/blocking" \
        -H "Content-Type: application/json" \
        -H "sid: $sid" \
        -d '{"blocking":true,"timer":null}')

    echo "Pi-hole DNS blocking renabled."

    response=$(curl -s -X DELETE "${PIHOLE_HOST}/api/auth" \
        -H "sid: $sid")
    echo "Pi-hole session deleted."
}

main() {
    if [[ -z "$PASSWORD" ]] || [[ "$PASSWORD" == "your_password" ]]; then
        echo "Error: Please set your Pi-hole password in the script"
        exit 1
    fi

    auth_and_enable
}

main