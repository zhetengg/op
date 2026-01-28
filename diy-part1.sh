#!/bin/bash
set -e

export GIT_TERMINAL_PROMPT=0

# OpenClash
git clone --depth=1 https://github.com/vernesong/OpenClash package/luci-app-openclash

# 修 util-linux GCC13 编译错误
sed -i 's/-Werror//g' package/utils/util-linux/Makefile
