#!/bin/bash

echo "== DIY Part 1: feeds =="

# OpenClash 官方源（保留）
grep -q openclash feeds.conf.default || \
  sed -i '$a src-git openclash https://github.com/vernesong/OpenClash.git' feeds.conf.default

# ===== Actions 环境下，禁止 kenzok8 大源 =====
if [ "$GITHUB_ACTIONS" = "true" ]; then
  echo "Running in GitHub Actions: skip kenzok8 feeds to save space"
else
  echo "Local build: enable kenzok8 feeds"
  sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
  sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
fi

# Dockerman 第三方源（默认关闭，避免重复）
# sed -i '$a src-git dockerman https://github.com/lisaac/luci-app-dockerman.git' feeds.conf.default

echo "feeds.conf.default:"
cat feeds.conf.default
