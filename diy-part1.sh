#!/bin/bash

# OpenClash
git clone --depth=1 https://github.com/vernesong/OpenClash \
  package/luci-app-openclash

# iStore 核心
git clone --depth=1 https://github.com/linkease/istore \
  package/istore

# iStore UI
git clone --depth=1 https://github.com/linkease/istore-ui \
  package/istore-ui

# 文件管理
git clone --depth=1 https://github.com/linkease/luci-app-filebrowser \
  package/luci-app-filebrowser
