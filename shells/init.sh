#!/usr/bin/env bash

# ----------------------------------------------------------------------------
# 初次使用或更新代码后执行
# ----------------------------------------------------------------------------

# 跳到当前目录
cd $(dirname "$0")

# ----------------------------------------------------------------------------
# Global Variables:
#   BASE_DIR   当前目录的绝对路径
#   ROOT_DIR   根目录
#   SERVER_DIR DOF Server 所在目录
# ----------------------------------------------------------------------------
readonly BASE_DIR=$(pwd)
readonly ROOT_DIR="${BASE_DIR}/.."
readonly SERVER_DIR="${ROOT_DIR}/server"

read -p "请输入您的内网 IP(如没有请填外网 IP): " privateIP # TODO 尝试自动获取
if [ -z "$privateIP" ]; then
    echo "内网 IP 不能为空."
    exit 1
fi
read -p "请输入您的外网 IP(直接回车使用内网 IP): " publicIP
publicIP=${publicIP:-${privateIP}}
read -p "请输入您的数据库 IP(直接回车使用 127.0.0.1): " DBIP
DBIP=${DBIP:-127.0.0.1}
read -p "请数据数据库端口(直接回车使用 3306):" DBPort
DBPort=${DBPort:-3306}
read -p "请数据数据库用户名(直接回车使用 game):" DBUser
DBUser=${DBUser:-game}
read -p "请数据数据库密码(直接回车使用 uu5!^%jg):" DBPass
DBPass=${DBPass:-"uu5!^%jg"}
read -p "请数据数据库 TEA 密码(直接回车使用 20e35501e56fcedbe8b10c1f8bc3595be8b10c1f8bc3595b):" DBTEAPass
DBTEAPass=${DBTEAPass:-20e35501e56fcedbe8b10c1f8bc3595be8b10c1f8bc3595b}

echo "外网 IP: ${publicIP}"
echo "内网 IP: ${privateIP}"
echo "数据库 IP: ${DBIP}"
echo "数据库端口: ${DBPort}"
echo "数据库用户名: ${DBUser}"
echo "数据库密码: ${DBPass}"
echo "数据库 TEA 密码: ${DBTEAPass}"
read -p "以上信息是否正确? (y/n): " answer
    case $answer in
        y|Y)
            sed -i "s/<PrivateIP>/${privateIP}/g" `find ${SERVER_DIR} -type f -name "*.tbl"`
            sed -i "s/<PrivateIP>/${privateIP}/g" `find ${SERVER_DIR} -type f -name "*.cfg"`
            sed -i "s/<PublicIP>/${publicIP}/g" `find ${SERVER_DIR} -type f -name "*.tbl"`
            sed -i "s/<PublicIP>/${publicIP}/g" `find ${SERVER_DIR} -type f -name "*.cfg"`
            sed -i "s/<DBIP>/${DBIP}/g" `find ${SERVER_DIR} -type f -name "*.cfg"`
            sed -i "s/<DBPORT>/${DBPort}/g" `find ${SERVER_DIR} -type f -name "*.cfg"`
            sed -i "s/<DBUSER>/${DBUser}/g" `find ${SERVER_DIR} -type f -name "*.cfg"`
            sed -i "s/<DBPASS>/${DBPass}/g" `find ${SERVER_DIR} -type f -name "*.cfg"`
            sed -i "s/<DBHASHPASS>/${DBTEAPass}/g" `find ${SERVER_DIR} -type f -name "*.cfg"`

            # TODO 自动连接 MySQL 修改 db_connect

            echo "自动修改配置文件完成，请注意检查数据库中的连接信息是否正确."
            echo "您可以正常启动 DOFServer 了"
            ;;
        *)
            echo "请重新运行脚本并输入正确的信息重试."
            ;;
    esac
