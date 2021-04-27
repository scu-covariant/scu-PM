# 数据库连接范例
+ 目前配置完成了一个可以在协会`hackerspace`网络环境下，连上协会的`mysql`数据库的`covscript`程序。
+ 如果服务器崩了请联系尧哥。
+ 目前连上服务器的账号是马晓晨的测试账号，可以尝试使用一下，其他的操作细节，请使用mysql语句自行尝试。网上有图形化操作mysql数据库的软件，`navicat`有破解版，实在找不到找马晓晨要。
+ 协会的服务器，内网地址为`192.168.233.14`,端口(port)为`3306`
+ 账号可以用`sunnyhaze`,密码为`12345678`，如果不熟悉sql语句请不要乱操作，最多只对`testdb`数据库进行操作，切记！
+ 需要了解sql语句。
# 初次使用MySQL版covscript体验
+ 注意，在某台电脑上初次使用，需要在Windows环境下配置`odbc`数据源。涉及的操作有：
  + 下载连接`Maria-DB`的拓展，并按要求安装[【官方connector】](https://downloads.mariadb.com/Connectors/odbc/connector-odbc-3.0.2/)
  + 在Windows左下角的搜索中搜索`ODBC`，找到`ODBC数据源（64位）`，选择添加`MariaDB ODBC 3.0`
    + name是该数据源的名字，建议为`hackerspace`，描述信息随意
    + 下一页很重要，选择`TCP/IP`协议，然后server name为`192.168.233.14`，port为`3306`后续的使用马晓晨的公开账户即可，上文有。最下面的选择数据库的下拉菜单，请选择`testdb`即可。
    + 后面页码的没记错的化应该啥都不用写，一路next到最后即可。
+ 程序样例通过本目录下的`db_config.json`连接到该数据源，json中的name必须是上文中的`name`
+ 然后应该就可以在`hackerspace`网络环境下运行样例程序了。
# 初次使用sqlite的covscript体验
+ 这个没有验证，而且所有数据均在本地的一个文件中，突出轻量级特征
+ 方便协作开发
+ 暂时未完成代码，敬请期待。