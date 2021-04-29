import db_connector
var db = db_connector.start()
if db == null
    system.out.println("连接失败,程序终止！")
    system.exit(1)
end
## 测试样例程序，遍历testtb表中的所有内容
var res = db.exec("select * from testtb")
foreach i in res
    foreach j in i
        system.out.print(j.data+' ')
    end
    system.out.println("")
end