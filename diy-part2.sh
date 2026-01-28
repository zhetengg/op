#!/bin/bash
set -e

# 创建 Docker 数据目录（挂载点 /mnt/docker）
mkdir -p /mnt/docker

# 设置 Docker 默认数据目录
uci set dockerd.globals.data_root='/mnt/docker'
uci commit dockerd

# 启动 / 重启 Docker 服务
/etc/init.d/dockerd enable
/etc/init.d/dockerd restart

# 输出信息确认
echo "Docker 数据目录已设置为 /mnt/docker"
df -h /mnt/docker

# 1. 修改默认 IP
sed -i 's/192.168.1.1/192.168.5.1/g' \
  package/base-files/files/bin/config_generate
