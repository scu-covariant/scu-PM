import db_connector
var db = db_connector.start()
var p = system.out.println # 简化输出
# 这里主要是实现数据库的增删查改
# 会很多的用到sql语句，所以要加以学习，sql语句不区分大小写，但是原则上关键字要大写，变量小写，不做要求。
# 推荐菜鸟和w3cschool
# 注意区分数据库与数据表的关系，即一个数据库（本次开发的数据库名为scupm）包含很多数据表

# 查看全部数据表信息的方法，但这个东西会把所有的配置表、乱七八糟的表都返回来，所以用处不大
var indexs = db.table_list()
p("========整个数据库的全部数据表名称=======")
foreach i in range(indexs.size)
    p(indexs[i])
end


# 输出 testtb的信息
function testtb_out()
    res = db.exec("select * from testtb")
    foreach i in res
        foreach j in i
            system.out.print(j.data+' ')
        end
        system.out.println("")
    end
end

#======================= 查 =======================
p("=========按条件查询：=========")
# 按条件筛选查找teststu表格中的信息
var in_sex = "男"
var res = db.exec("select 学号,姓名,性别 from teststu where 性别=\""+ in_sex +"\"")
# exec返回一个二维数组，每一个元素是一条完整记录
# 具体用法，请多多查询sql语句的使用技巧
# 也可以用单引号替代转义的 【\"】
# 输出
foreach i in res
    foreach j in i
        if j.data!=null
            system.out.print(j.data + " ")        
        end
    end
    system.out.println("")
end
#======================= 查 =======================
#======================= 增 =======================
p("$按条件添加一条信息：")
# 向testtb中添加你的名字
function add(name,mayjor,gender)
    # statement的缩写，表示即将输入数据库的sql语句
    # testtb 的字段分别为 id-姓名-专业-性别
    var stmt = db.prepare("INSERT INTO testtb(姓名,专业,性别) values(?,?,?)")
    # prepare是准备一条可以使用的sql语句，可以使用？作为匹配（类比printf）
    stmt.bind(0,name)
    stmt.bind(1,mayjor)
    stmt.bind(2,gender)
    # 以上是将信息与对应的？绑定
    # 以下执行准备好的sql语句
    stmt.just_exec()
    # just_exec是立即执行，没有返回值，而exec是有返回值的，一般用于查询
end
# 其他的所有语句也可以这样进行绑定操作，简化流程
add("李言荣","chemistry","男")
#======================= 增 =======================
p("=====添加后的结果：=====")
testtb_out() # 查看添加结果
#======================= 删 =======================
p("$删除刚才添加的信息：")
db.just_exec("DELETE FROM testtb WHERE 姓名='李言荣'")
# delete语句会删除所有符合条件的记录，进阶操作方法请进一步了解sql语句
# 建议在设计的时候一定where后面跟的是查询主键（即唯一ID）防止误删
#======================= 删 =======================
p("=====删除条目后的结果：=======")
testtb_out()
#======================= 改 =======================
p("$修改所有专业为cs人的的性别为女")
db.just_exec("UPDATE testtb SET 性别='女' where 专业='cs'")
testtb_out()
p("$再修改回来性别")
db.just_exec("UPDATE testtb SET 性别='男' where 专业='cs'")
testtb_out()
p("==========完成数据库修改========")
#======================= 改 =======================
