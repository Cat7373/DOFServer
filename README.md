# DOFServer
My DOFServer

## 环境要求
* CentOS 5.x (推荐 5.8)
* MySQL 5.x
* 存储空间 >= 15GB

## 部署流程
1. 下载本包放至任意位置并解压
2. 安装数据库，导入数据
3. 将 pvf 文件放入 server/game 目录
4. 执行 shell/env.sh (一次性)
5. 执行 shell/init.sh (每次更新本包均需重新执行)
6. 执行 shell/start.sh 启动
7. 执行 shell/stop.sh 结束

## TODO
* 数据库
* 客户端
* 拍卖行
* 金币寄售
* 部署环境
    * PVF
    * 数据库
