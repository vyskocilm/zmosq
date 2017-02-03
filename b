#!/bin/bash

set -x

if [[ -z "${MOSQ_BASE}" ]]; then
    echo "Run MOSQ_BASE=/path/to/your/mosquitto ./b"
    exit 1
fi

LIBDIR="${MOSQ_BASE}/build/lib/"
INCDIR="${MOSQ_BASE}/lib/"

gcc -I${INCDIR} -std=c99 mysub.c -L${LIBDIR} -lmosquitto -o mysub && \
    LD_LIBRARY_PATH=${LIBDIR} ./mysub