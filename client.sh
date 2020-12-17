#!/bin/bash

clientId="$1"
req="$2"

if [ "$#" -lt 2 ]; then
	echo "Error: parameters problem" >&2
	exit 1

