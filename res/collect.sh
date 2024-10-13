#!/bin/bash

# get gpu json from ./gpu.sh
gpu_info=$(./gpu.sh)

# get prover json from ./prover.sh
prover_info=$(./prover.sh)

# combine result to a single json
json_output=$(jq -nc \
    --argjson gpu_info "$gpu_info" \
    --argjson prover_info "$prover_info" \
    '{gpu_info: $gpu_info, prover_info: $prover_info}')

# output json
echo "$json_output" | jq .