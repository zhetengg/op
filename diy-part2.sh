#!/bin/bash
set -e

echo "== DIY Part 2: config tweak =="

# 1. 修改默认 IP
sed -i 's/192.168.1.1/192.168.5.1/g' \
  package/base-files/files/bin/config_generate

# 2. 通用函数：安全设置 config
set_config() {
  local key="$1"
  local val="$2"
  if grep -q "^$key=" .config; then
    sed -i "s/^$key=.*/$key=$val/" .config
  else
    echo "$key=$val" >> .config
  fi
}

# 3. 必需 LuCI 插件（安全）
set_config CONFIG_PACKAGE_luci-app-openclash y
set_config CONFIG_PACKAGE_luci-app-adguardhome y
set_config CONFIG_PACKAGE_luci-app-dockerman y

# 4. Actions 环境下的 Docker 策略
if [ "$GITHUB_ACTIONS" = "true" ]; then
  echo "GitHub Actions detected: Docker runtime-only mode"

  set_config CONFIG_PACKAGE_docker y
  set_config CONFIG_PACKAGE_dockerd y

  # 关键：明确禁止 containerd
  set_config CONFIG_PACKAGE_containerd n

  # 防止被依赖拉回
  set_config CONFIG_PACKAGE_runc y
else
  echo "Local build: full Docker stack allowed"

  set_config CONFIG_PACKAGE_docker y
  set_config CONFIG_PACKAGE_dockerd y
  set_config CONFIG_PACKAGE_containerd y
  set_config CONFIG_PACKAGE_runc y
fi

# 5. AdGuardHome：Actions 下禁止内置二进制
if [ "$GITHUB_ACTIONS" = "true" ]; then
  set_config CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary n
fi

echo "== Final Docker related config =="
grep -E "docker|dockerd|containerd|runc|adguardhome" .config || true
