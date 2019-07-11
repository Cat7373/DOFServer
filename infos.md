# Ports
> 内部端口用途速查，防火墙可配置只允许需要公开的端口通过

| 端口 | 协议 | 有效 | 移除 | 公开 | 说明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 2311 | UDP | √ | × | √ | Stun 使用 |
| 2312 | UDP | √ | × | √ | Stun 使用 |
| 2313 | UDP | √ | × | √ | Stun 使用 |
| 7000 | TCP/UDP | √ | × | √ | Bridge 使用 |
| 7001 | TCP/UDP | √ | × | √ | Channel 使用 |
| 7200 | TCP/UDP | √ | × | √ | Relay 使用 |
| 10011 | TCP | √ | × | √ | 刷图频道 |
| 10031 | TCP | √ | × | √ | PVP 频道 |
| 11011 | UDP | √ | × | √ | 刷图频道 |
| 11031 | UDP | √ | × | √ | PVP 频道 |
| 20203 | TCP/UDP | √ | × | × | dbmw_mnt 使用 |
| 20303 | TCP/UDP | √ | × | × | dbmw_stat 使用 |
| 20403 | TCP/UDP | √ | × | × | dbmw_guild 使用 |
| 30303 | TCP/UDP | √ | × | × | monitor 使用 |
| 30403 | TCP/UDP | √ | × | × | guild 使用 |
| 30503 | UDP | √ | × | × | statics 使用 |
| 30603 | TCP/UDP | × | √ | ? | 金币寄售(point) |
| 30701 | UDP | √ | × | × | Coserver 使用 |
| 30803 | TCP/UDP | × | √ | ? | 拍卖行(auction) |
| 31100 | TCP | √ | × | × | Community 使用 |
| 40401 | TCP/UDP | √ | × | × | manager 使用 |

# Ips
> 内部配置中的 IP 均已使用下面三种代码代替，使用前请进行全局替换改为真实 IP

<PublicIP>   外部 IP(对外公开的服务)
<PrivateIP>  内部 IP(内部使用的服务)
<DBIP>       数据库 IP
