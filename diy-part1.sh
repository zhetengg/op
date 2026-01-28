#!/bin/bash
set -e

# 禁止 git 交互（CI 必须）
export GIT_TERMINAL_PROMPT=0

# OpenClash（唯一额外 clone）
git clone --depth=1 https://github.com/vernesong/OpenClash \
  package/luci-app-openclash
