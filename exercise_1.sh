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
../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra \
  --workload-configuration=./inputs/workload/ASTRA-sim-1.0/Resnet50_DataParallel.txt \
  --network-configuration=./inputs/network/analytical/FullyConnected.yml \
  --system-configuration=./inputs/system/FullyConnected.json \
  --remote-memory-configuration=./inputs/remote_memory/analytical/no_memory_expansion.json
