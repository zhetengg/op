#!/bin/bash
# 1. 修改默认 IP 为 192.168.5.1 (按需修改)
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 2. 确保配置里选中了核心插件（防止手动选漏）
echo "CONFIG_PACKAGE_luci-app-openclash=y" >> .config
echo "CONFIG_PACKAGE_luci-app-adguardhome=y" >> .config
