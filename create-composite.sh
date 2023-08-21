#!/bin/bash

# Check if argument is supplied
if [ -z "$1" ]; then
  echo "No argument supplied. Please provide a file name."
  exit 1
fi

./composedb composite:create models/"$1".graphql --output=composites/"$1".json

# Wait for the file to stop changing 
# while [ -e /proc/$(pgrep -f "./composedb composite:create models/$1.graphql --output=composites/$1.json") ]; do
#     sleep 1
# done

# Use jq to extract keys_unsorted[0]
cat ./composites/"$1".json | jq '.models | keys_unsorted[0]'