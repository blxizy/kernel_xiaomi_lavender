#!/bin/bash
# Враппер для Proton Clang (разделение архитектуры компиляции)

if [[ "$*" == *"-mfloat-abi="* ]] || [[ "$*" == *"-m32"* ]] || [[ "$*" == *"-marm"* ]]; then
    exec clang --target=arm-linux-gnueabi -B /usr/bin/arm-linux-gnueabi- -fintegrated-as -Qunused-arguments -Wno-asm-operand-widths "$@"
else
    exec clang --target=aarch64-linux-gnu -B /usr/bin/aarch64-linux-gnu- -Qunused-arguments -Wno-asm-operand-widths "$@"
fi
