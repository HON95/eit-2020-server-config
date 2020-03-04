#!/bin/bash

set -eu

DEBUG=0

if (( $# < 4 )); then
    echo "Syntax: $0 <endpoint> <device-uuid> <ph> <temperature>"
    exit 0
fi

endpoint=$1
uuid=$2
ph=$3
temperature=$4

data="{ \
\"device\": \"$uuid\", \
\"ph\": \"$ph\", \
\"temperature\": \"$temperature\" \
}"

if [[ $DEBUG == 1 ]]; then
    echo "$data"
    echo
fi

while true; do
    curl --header "Content-Type: application/json" --request POST --data "$data" "$endpoint"
    echo
done
