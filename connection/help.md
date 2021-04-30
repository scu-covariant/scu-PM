# 数据库连接范例
+ 本文件夹下三个文件代表三种连接方式
+ `1sqlite.csc`利用sqlite连接到本文件夹下`PM.db`
+ `2remotedb_connect.csc`连接到公网服务器
+ `3hackerspace.csc`在协会`hackerspace`网络环境下进行连接
## 文件夹目录
+ `db.csp`是数据库的基本实现，需要外界提供`adapter`以完成数据库连接。
+ `remotedb_connect.csc`是完善的，带异常处理的，连接**本次项目开发**所需的外网数据库的样例。
+ `sqlite.csc`是以sqlite协议连接本文件夹下的`PM.db`文件的脚本
+ `hackerspace.csc`是在协会的`hackerspace`网络下，连接协会内网`Mysql`服务器的脚本
+ 后两个只是作为样例，时间充裕可以按下文的要求尝试，本次开发主要使用第一个方法。
# （必看）使用connecting string连接协会外网数据库
+ 这个方法相对简单且较为完善，如果不深入研究只是为了开发本系统，**只使用本方法即可**
## 连接方法
+ **安装驱动程序！！之前忘写了！很抱歉！！！**  
  + 下载连接`Maria-DB`的拓展，并按要求安装[【官方connector】](https://downloads.mariadb.com/Connectors/odbc/connector-odbc-3.0.2/)
+ 请在需要开展连接的脚本的同一目录下创建`login_config.json`文件，因为包含密码IP等信息，具体格式参见qq群，仅限内部使用。
+ 执行脚本即可，本例中即为`2remotedb_connect.csc`，有完善的异常处理功能，后期可能会转换为GUI界面。
+ 按照`csdbc`的wiki更改`db.csp`内的具体函数，SQL语句即可进行不同的数据库操作。
# （可以不看）使用Windows内置ODBC数据源连接数据库
## 协会服务器简介
+ 目前配置完成了一个可以在协会`hackerspace`网络环境下，连上协会的`mysql`数据库的`covscript`程序。
+ 如果服务器崩了请联系尧哥。
+ 目前连上服务器的账号是马晓晨的测试账号，可以尝试使用一下，其他的操作细节，请使用mysql语句自行尝试。网上有图形化操作mysql数据库的软件，`navicat`有破解版，实在找不到找马晓晨要。
+ 协会的服务器，内网地址为`192.168.233.14`,端口(port)为`3306`
+ 账号可以用`sunnyhaze`,密码为`12345678`，如果不熟悉sql语句请不要乱操作，最多只对`testdb`数据库进行操作，切记！
+ 需要了解sql语句。
## 需要完成的配置
+ 注意，在某台电脑上初次使用，需要在Windows环境下配置`odbc`数据源。涉及的操作有：
  + 下载连接`Maria-DB`的拓展，并按要求安装[【官方connector】](https://downloads.mariadb.com/Connectors/odbc/connector-odbc-3.0.2/)
  + 在Windows左下角的搜索中搜索`ODBC`，找到`ODBC数据源（64位）`，选择添加`MariaDB ODBC 3.0`
    + name是该数据源的名字，建议为`hackerspace`，描述信息随意
    + 下一页很重要，选择`TCP/IP`协议，然后server name为`192.168.233.14`，port为`3306`后续的使用马晓晨的公开账户即可，上文有。最下面的选择数据库的下拉菜单，请选择`testdb`即可。
    + 后面页码的没记错的化应该啥都不用写，一路next到最后即可。
+ 程序样例通过本目录下的`db_config.json`连接到该数据源，json中的name必须是上文中的`name`
+ 然后应该就可以在`hackerspace`网络环境下运行样例程序了。
# （可以随便试试）初次使用sqlite的covscript体验
+ 这个方式不会对用户权限进行验证，而且所有数据均在本地的一个文件中，突出轻量级特征
+ 方便协作开发
+ 通过`sqlite.csc`与本文件夹下的`PM.db`进行连接，语法简明清晰。
+ 可视化修改数据库，可以使用`Sqlite expert professional`这个软件连接`PM.db`进行修改。