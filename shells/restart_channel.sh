#!/usr/bin/env bash

# ----------------------------------------------------------------------------
# 重启 Channel
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

# 附加 lib 目录
export LD_LIBRARY_PATH=${SERVER_DIR}/lib

# 停止 Channel
killall -9 df_channel_r
sleep 3

echo "##### channel start #####"
cd ${SERVER_DIR}/channel
rm -fv pid/*
rm -fv log/*
chmod +x df_channel_r
./df_channel_r channel start &
