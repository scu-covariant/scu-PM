# 四川大学物资管理系统

[![Mainpage](https://img.shields.io/badge/主页-SCU_Property_Manager-orange)](https://github.com/scu-covariant/scu-PM)
[![Powered by](https://img.shields.io/badge/开发-四川大学智锐科创计算机社团-blue)](https://github.com/scu-covariant/)
</div>

+ 本仓库是四川大学物资管理系统的开发仓库
+ 由四川大学智锐科创计算机协会开发
+ 计划初步部署于四川大学
## 学习参考文献
+ 请从[【cov学习相关教程链接.md】](/docs/cov学习相关教程连接.md)中了解相关知识的链接和组织。
+ [基于`covscript`的物资管理系统](https://github.com/chengdu-zhirui/property-manager)
  + 大部分技术方案均可参考此项目
## 文件夹结构
+ `/connection`是cov连接数据库的三种方法
  + `db.csp`是数据库查找函数的样例，其他函数等待补充
  + 三个带序号的分别是不同方式连接不同数据库的方法，详情参见[【数据库连接帮助】](connection/help.md)
  + 第二个连接需要`db_config.json`的账户密码信息完成数据库配置，该文件**一定不要上传到github！！！**(已经配置了.gitignore,不改名就不用担心)
+ `/develop`文件夹是本项目开发任务的进行文件夹
  + 务必阅读[【注意事项】](develop/开发注意事项.md)
  + **开发详情**在：
    + [【开发文档】](docs/develop.md)抽象过的实现细节，需要详细研读 （**目前未完成**）
    + [【需求文档】](Requirement.md)是学校提供的软件需求
  + 同理本文件夹也需要配置数据库，**`login_config.json`账户信息也不要上传、外传。**
  + 分工和任务会尽快分配。
+ `/examples`中包含样例有：
  + 正则表达式样例
  + 两个gui样例
+ `/homework`是作业文件夹
## 技术选型
+ 采用[`Covscript`]()进行开发。
+ 数据库采用`Mysql`或者其开源版本`MariaDB`
+ 细节请参见[【开发文档】](docs/develop.md)

## 进度
+ [【分工文档】(未完成)](docs/分工文档.md)
### 总进度
- [x] 开发文档完成，正式立项
- [ ] 分工完成，各自知晓任务，并推进进度
- [ ] 完成数据库配置，数据表结构搭建
- [ ] 完成各个前端部分
- [ ] 进行为期一周的调试工作
- [ ] 尝试发布
### 进度记录
采用石墨文档进行进度记录，请各位成员按时完成自己的进度内容。[石墨文档地址](https://shimo.im/docs/vVAXV24x9ntb4Eqm)