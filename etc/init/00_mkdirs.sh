#!/bin/bash
DIR_TARGETS=(
    ${HOME}/.config
)

for DIR_TARGET in ${DIR_TARGETS[@]}; do
    if [ ! -d ${DIR_TARGET} ]; then
        echo mkdir ${DIR_TARGET}
    fi
done
