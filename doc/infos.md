# Ports
> 内部端口用途速查，防火墙可配置只允许需要公开的端口通过

| 端口 | 协议 | 有效 | 公开 | 说明 |
| ---- | ---- | ---- | ---- | ---- |
| 2311 | UDP | √ | √ | Stun 使用 |
| 2312 | UDP | √ | √ | Stun 使用 |
| 2313 | UDP | √ | √ | Stun 使用 |
| 7000 | TCP/UDP | √ | √ | Bridge 使用 |
| 7001 | TCP/UDP | √ | √ | Channel 使用 |
| 7200 | TCP/UDP | √ | √ | Relay 使用 |
| 10011 | TCP | √ | √ | 刷图频道 |
| 10031 | TCP | √ | √ | PVP 频道 |
| 11011 | UDP | √ | √ | 刷图频道 |
| 11031 | UDP | √ | √ | PVP 频道 |
| 20018 | TCP | √ | × | 刷图频道 exchange |
| 20020 | TCP | √ | × | PVP 频道 exchange |
| 20203 | TCP/UDP | √ | × | dbmw_mnt 使用 |
| 20303 | TCP/UDP | √ | × | dbmw_stat 使用 |
| 20403 | TCP/UDP | √ | × | dbmw_guild 使用 |
| 30303 | TCP/UDP | √ | × | monitor 使用 |
| 30403 | TCP/UDP | √ | × | guild 使用 |
| 30503 | UDP | √ | × | statics 使用 |
| 30603 | TCP/UDP | × | × | 金币寄售(point) |
| 30701 | UDP | √ | × | Coserver 使用 |
| 30803 | TCP/UDP | √ | × | 拍卖行(auction) |
| 31100 | TCP | √ | × | Community 使用 |
| 40401 | TCP/UDP | √ | × | manager 使用 |

# 配置
> 内部配置中部分参数已使用下面的代码代替，使用前请进行全局替换改为实际值

* &lt;PublicIP&gt;   外部 IP(对外公开的服务)
* &lt;PrivateIP&gt;  内部 IP(内部使用的服务)
* &lt;DBIP&gt;       数据库 IP
* &lt;DBPORT&gt;     数据库端口
* &lt;DBUSER&gt;     数据库用户名
* &lt;DBPASS&gt;     数据库密码
* &lt;DBHASHPASS&gt; 经过 TEA 加密后的数据库密码 <!-- TODO Hash 算法？ -->
