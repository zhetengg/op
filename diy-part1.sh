#!/bin/bash
set -e

# 禁止 git 交互
export GIT_TERMINAL_PROMPT=0

# 只 clone OpenClash
git clone --depth=1 https://github.com/vernesong/OpenClash package/luci-app-openclash
