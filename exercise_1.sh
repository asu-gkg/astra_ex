#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
BINARY="${SCRIPT_DIR}/../build/AnalyticalAstra/bin/AnalyticalAstra"
ANALYTICAL_DIR="${SCRIPT_DIR}/../astra-sim/build/astra_analytical"
RESULT_DIR="${SCRIPT_DIR}/result"

# Inputs
NETWORK="${SCRIPT_DIR}/inputs/ring.json"
SYSTEM="${SCRIPT_DIR}/inputs/ring.txt"
WORKLOAD="${SCRIPT_DIR}/inputs/all_reduce.txt"


# 1. Setup
rm -rf ${RESULT_DIR}
mkdir -p ${RESULT_DIR}

# 2. Run ASTRA-sim
../extern/network_backend/ns-3/build/scratch/ns3-dev-AstraSimNetwork-default \
    --workload-configuration=./inputs/all_reduce.txt \
    --network-configuration=./inputs/ring.json \
    --system-configuration=./inputs/ring.txt \

