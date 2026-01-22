#!/bin/bash

# 添加 OpenClash 官方源
sed -i '$a src-git openclash https://github.com/vernesong/OpenClash.git' feeds.conf.default

# 添加常用集成包（包含最新版 AdGuardHome 和一些增强插件）
sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# （可选）如果你想用特定作者的 Dockerman 优化版，可以取消下面这行的注释
# sed -i '$a src-git dockerman https://github.com/lisaac/luci-app-dockerman.git' feeds.conf.default
