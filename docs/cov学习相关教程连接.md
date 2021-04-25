# covscript 学习相关的教程链接
[scu-Property Management仓库](https://github.com/scu-covariant/scu-PM)
## cov安装与配置
+ 注意！之前安装过cov的（以安装器模式安装的，最好使用安装器卸载该cov，以移除对应的环境变量和注册表变量，以免引起冲突。
+ [官网教程](https://covariant.cn/install-covscript/)，包括：
  + covscript的安装方式
  + vscode下代码高亮环境的配置
<font color="red" size=18>注意注意！</font>

+ <font color = "red">当你面对某些代码运行不了，需要`import`的情况，请在确保网络通畅的情况下，在终端命令行中利用`cspkg`工具，按照命令提示下载</font>，具体实现为：
```shell
cspkg -i imgui
```
通过以上方式实现了安装`imgui`库以运行带有GUI的程序。
更多细节查询可以在安装`covscript.msi`后通过
```shell
cspkg -h
```
查看帮助，了解`covscript`包管理的细节。
+ CSPKG包管理系统的细节请参考[CSPKG官方仓库](https://github.com/covscript/cspkg)
## cov必须知道的四个仓库以及连接
### 标准库wiki 
+ [标准库wiki](http://wiki.csman.info/reference.grammar)
  + 本网址主要面向开发者，语言精练，架构清晰，适用于对主流编程语言有一定了解的开发者学习
### 零基础入门教材仓库
+ 本仓库比较基础，言辞较多，未来考虑面向零基础人员设计，有一定的导引意义，可以带着你写下前几个`covscript`程序。
+ [教材仓库](https://github.com/chengdu-zhirui/Cov-teaching-material/)
  + 主要解释了编程语言基本要素的使用方法
    + 输入输出
    + 分支循环语句
    + 类与继承
  + 并且提供了几个样例以供理解（不包含GUI）
### Covscript官方仓库
+ 是`covscript`进行官方维护，更新，发布的仓库地址。
+ [covscript官方仓库](https://github.com/covscript/covscript)`
  + `examples`文件夹下有大量样例，分别对应不同的模块和包，以供研习。
  + 本次开发中主要是学习GUI和数据库接口
  + 主要是学习`example`文件夹下的样例，对于本项目的设计，建议学习：
    + `chat_client.csc`是GUI实现的基础样例`chat_server.csc`是没有GUI的，但是想利用其实现聊天室需要这个进行服务，看一下就好。
    + `db_editor.csc`是数据库访问接口的实现，需要连接数据库的同学请在这里查询
### MGUI仓库，COVSCRIPT图形库的维护
+ [cov-mgui test文件夹下有一些GUI样例](https://github.com/covscript/covscript-imgui/tree/master/tests)
  + **<font color=red>初次学习gui应当多多研习本仓库下的样例和功能！</font>**
  + 可以从这里了解GUI各种接口的实现和用法
