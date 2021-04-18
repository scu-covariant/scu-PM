# covscript 学习相关的教程链接
[scu-Property Management仓库](https://github.com/scu-covariant/scu-PM)
## cov安装与配置
+ 注意！之前安装过cov的（以安装器模式安装的，最好使用安装器卸载该cov，以移除对应的环境变量和注册表变量，以免引起冲突。
+ [官网教程](https://covariant.cn/install-covscript/)，包括
  + covscript的安装方式
  + vscode下代码高亮环境的配置
## cov相关
+ [教材仓库](https://github.com/chengdu-zhirui/Cov-teaching-material/)
  + 主要解释了编程语言基本要素的使用方法
    + 输入输出
    + 分支循环语句
    + 类与继承
  + 并且提供了几个样例以供理解（不包含GUI）
+ [covscript官方仓库](https://github.com/covscript/covscript)
  + 主要是学习GUI和数据库接口
  + 主要是学习`example`文件夹下的样例，对于本项目的设计，建议学习：
    + `chat_client.csc`是GUI实现的基础样例`chat_server.csc`是没有GUI的，但是想利用其实现聊天室需要这个进行服务，看一下就好。
    + `db_editor.csc`是数据库访问接口的实现，需要连接数据库的同学请在这里查询
+ [cov-mgui test下有一些GUI样例](https://github.com/covscript/covscript-imgui/tree/master/tests)
  + 可以从这里了解GUI各种接口的实现和用法