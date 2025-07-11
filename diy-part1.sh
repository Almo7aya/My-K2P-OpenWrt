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
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
git clone -b master --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/app/luci-app-unblockneteasemusic
git clone --depth 1 https://github.com/ilxp/luci-app-ikoolproxy.git package/app/luci-app-ikoolproxy

./scripts/feeds update -a

# fix : ubus_call_umdns()=ubus.c@1385
rm package/network/services/umdns/files/umdns.init
rm package/network/services/umdns/files/umdns.json
wget -P package/network/services/umdns/files https://raw.githubusercontent.com/openwrt/openwrt/main/package/network/services/umdns/files/umdns.init
wget -P package/network/services/umdns/files https://raw.githubusercontent.com/openwrt/openwrt/main/package/network/services/umdns/files/umdns.json

./scripts/feeds install -a

# 主题
# git clone https://github.com/thinktip/luci-theme-neobird.git feeds/luci/themes/luci-theme-neobird
# git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git feeds/luci/themes/luci-theme-opentomcat
# git clone https://github.com/derisamedia/luci-theme-alpha.git feeds/luci/themes/luci-theme-alpha
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon-18.06

# echo '### Argon Theme Config ###'
# rm -rf feeds/luci/themes/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
# # if have
# rm -rf feeds/luci/applications/luci-app-argon-config
# git clone https://github.com/jerrykuku/luci-app-argon-config.git feeds/luci/applications/luci-app-argon-config

./scripts/feeds update -a
./scripts/feeds install -a
