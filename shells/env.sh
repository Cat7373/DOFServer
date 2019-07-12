#!/usr/bin/env bash

# ----------------------------------------------------------------------------
# 初始化脚本，针对未运行过 DOFServer 的新系统一次性执行即可
# **** 需要 Root 权限 ****
# ----------------------------------------------------------------------------

# 跳到当前目录
cd $(dirname "$0")

# ----------------------------------------------------------------------------
# 添加 Swap
# ----------------------------------------------------------------------------
function addSwap() {
    read -p "是否需要添加 Swap? (y/n): " answer
    case $answer in
        y|Y)
            echo "正在添加 Swap..."

            # 如果有现存的 Swap，则关掉它，并删掉它
            swapoff /var/dof.swap 2>&1 > /dev/null
            rm -f /var/dof.swap 2>/dev/null

            # 创建 Swap 文件，如果有 fallocate 则用 fallocate，否则用 dd
            if command -v fallocate >/dev/null 2>&1; then
                fallocate --length 8GiB /var/dof.swap
            else
                dd if=/dev/zero of=/var/dof.swap bs=1M count=8192
            fi

            # 设置权限
            chmod 600 /var/dof.swap

            # 启用 Swap
            mkswap /var/dof.swap
            swapon /var/dof.swap

            # 保证系统使用 Swap(kernel < 3.5)
            echo "vm.swappiness = 10" > /etc/sysctl.conf
            sysctl -p

            # 以后开机时自动加载 Swap
            echo "/var/dof.swap swap swap default 0 0" > /etc/fstab

            echo "添加 Swap 完成."
            ;;
        *)
            ;;
    esac
}

# ----------------------------------------------------------------------------
# 准备 Geo 的文件
# ----------------------------------------------------------------------------
function initGeo() {
    mkdir -p /usr/local/share/GeoIP
    rm -f /usr/local/share/GeoIP/GeoIP.dat
    ln -s $(pwd)/geo/GeoIP.dat /usr/local/share/GeoIP/GeoIP.dat
    echo "初始化 Geo 完成."
}

addSwap
initGeo

echo "准备完成，请确保安装数据库和导入数据，并手动放入 Script.pvf 后使用."
