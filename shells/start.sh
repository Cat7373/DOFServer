#!/usr/bin/env bash

# ----------------------------------------------------------------------------
# 启动 DOFServer
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

# 移除 pid 文件、日志、Core 文件
echo "Start removing junk files."
find ${SERVER_DIR} -name '*.pid' -type f | xargs rm -fv
find ${SERVER_DIR} -name '*.log' -type f | xargs rm -fv
find ${SERVER_DIR} -name 'core.*' -type f | xargs rm -fv
rm -rfv ${SERVER_DIR}/game/log/*
echo "End junk file removal."
sleep 1

echo "##### stun start #####"
cd ${SERVER_DIR}/stun
chmod +x df_stun_r
./df_stun_r start &
sleep 1

echo "##### community start #####"
cd ${SERVER_DIR}/community
chmod +x df_community_r
./df_community_r community start &
sleep 1

echo "##### bridge start #####"
cd ${SERVER_DIR}/bridge
chmod +x df_bridge_r
./df_bridge_r bridge start &
sleep 3

echo "##### statics start #####"
cd ${SERVER_DIR}/statics
chmod +x df_statics_r
./df_statics_r stat_cain start &
sleep 1

echo "##### coserver start #####"
cd ${SERVER_DIR}/coserver
chmod +x df_coserver_r
./df_coserver_r coserver start &
sleep 1

echo "##### dbmw_guild start #####"
cd ${SERVER_DIR}/dbmw_guild
chmod +x df_dbmw_r
./df_dbmw_r dbmw_gld_cain start &
sleep 1

echo "##### dbmw_mnt start #####"
cd ${SERVER_DIR}/dbmw_mnt
chmod +x df_dbmw_r
./df_dbmw_r dbmw_mnt_cain start &
sleep 1

echo "##### dbmw_stat start #####"
cd ${SERVER_DIR}/dbmw_stat
chmod +x df_dbmw_r
./df_dbmw_r dbmw_stat_cain start &
sleep 1

echo "##### manager start #####"
cd ${SERVER_DIR}/manager
chmod +x df_manager_r
./df_manager_r manager start &
sleep 1

echo "##### monitor start #####"
cd ${SERVER_DIR}/monitor
chmod +x df_monitor_r
./df_monitor_r mnt_cain start &
sleep 3

echo "##### relay start #####"
cd ${SERVER_DIR}/relay
chmod +x df_relay_r
./df_relay_r relay_200 start &
sleep 3

echo "##### channel start #####"
cd ${SERVER_DIR}/channel
chmod +x df_channel_r
./df_channel_r channel start &
sleep 1

echo "##### guild start #####"
cd ${SERVER_DIR}/guild
chmod +x df_guild_r
./df_guild_r gld_cain start &
sleep 3

echo "##### auction start #####"
cd ${SERVER_DIR}/auction
chmod +x df_auction_r
./df_auction_r ./cfg/auction_siro.cfg start ./df_auction_r &
sleep 3

echo "##### gunnersvr start #####"
cd ${SERVER_DIR}/secsvr/gunnersvr
chmod +x gunnersvr
./gunnersvr -t30 -i1 &
sleep 3

echo "##### zergsvr start #####"
cd ${SERVER_DIR}/secsvr/zergsvr
chmod +x secagent
chmod +x zergsvr
./secagent &
./zergsvr -t30 -i1 &
sleep 3

echo "##### game start #####"
cd ${SERVER_DIR}/game
chmod +x df_game_r
./df_game_r cain01 start &
sleep 120

echo "##### pvp start #####"
./df_game_r cain02 start &
