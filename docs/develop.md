# 开发文档
## 系统结构
系统由**服务器**和**前端**两大部分构成，其中前端又可分为两种，分别是**校区管理员**以及**小组管理员**。所有的前端均与数据库直连，通过数据库的权限管理实现分级管理的效果。
## 关系数据表格式
### 物品数据表
所有字段请与[需求表](Requirement.md)中的信息按序比对。(第一项是唯一ID，未来可以对应二维码)
```sql
CREATE TABLE propertys(
    uuid char(12),
    sbmc int,
    ggxh char(20),
    pp char(20),
    wbdw char(40),
    qysj date,
    zbqx int,
    sfjz int,
    sfbf int,
    sfkby int,
    dqdd char(12), 
)
```
最后一项是“当前地点”。
(注意这里面没有地点相关的信息和故障信息，分别存放在地点表和故障表)
### 地点表
用于生成每一个地点的位置和唯一的id用于字段间引用
```sql
CREATE TABLE places(
    UUID char(12)
    dd_first char(10),
    dd_second char(10),
    dd_third int,
    dd_fourth char(10),
)
```
+ first为校区
+ second为教学楼
+ third为层数
+ fourth为门牌号
### 变动地点表
```sql
CREATE TABLE move_places(
    item_id char(12),
    from_place char(12),
    to_place char(12),
    move_time date
)
```
保存了每一次移动的物品id，初始地点，去向，以及移动时间
### 故障信息表
```sql
CREATE TABLE move_places(
    item_id char(12),
    reason varchar(200),
    repair_time date,
    repair_method varchar(200)
)
```
## 前端实现
### 登录界面
+ 无论哪个前端，均需要一个登录界面与数据库沟通，获取访问权限。
仅仅实现输入用户名并保存即可，用于与数据库沟通确认身份使用。
+ 需要实现密码模糊化。
### 校区管理员操作界面