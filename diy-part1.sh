#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' feeds.conf.default
echo 'src-git sm https://github.com/kenzok8/small-packaget' feeds.conf.default
#git clone --depth=1 https://github.com/immortalwrt/homeproxy.git package/homeproxy
#echo 'src-git small https://github.com/kenzok8/small-package' >>feeds.conf.default
#echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
#git clone https://github.com/kenzok8/small.git package/openwrt-small
#git clone https://github.com/vi-si/luci-app-openclash.git package/luci-app-openclash
#echo 'src-git vernesong https://github.com/vernesong/OpenClash' >>feeds.conf.default
#echo 'src-git immortalwrt https://github.com/immortalwrt/homeproxy' >>feeds.conf.default

