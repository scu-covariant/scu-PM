import csv
import structs
import db_connector
import new_request

var values = {{}}
<<<<<<< Updated upstream
var group_admin = 46

new_request.check_csv("data.csv", values)

var prop = new structs.property
var plac = new structs.place
var requ = new structs.request
var a = new array
var b = new array
var c = new array

# var db = db_connector.start()
# db.exec("DELETE FROM places;")
# db.exec("DELETE FROM propertys;")
# db.exec("DELETE FROM request_tb;")

foreach i in values
    new_request.single_insert(i, prop, plac, requ, group_admin)
    a.push_back(prop)
    b.push_back(plac)
    c.push_back(requ)
    # runtime.delay(1000)
end

var count = 0
foreach p in a
    p.iter_prepare()
    b[count].iter_prepare()
    c[count].iter_prepare()
    foreach i in p.arr
        # system.out.print(type(i))
        # system.out.print(" ")
        system.out.print(i)
        system.out.print(" ")
    end
    foreach i in b[count].arr
        # system.out.print(type(i))
        # system.out.print(" ")
        system.out.print(i)
        system.out.print(" ")
    end
    foreach i in c[count].arr
        # system.out.print(type(i))
        # system.out.print(" ")
        system.out.print(i)
        system.out.print(" ")
    end
    system.out.print("\n")
    count++
end
=======
var group_admin = 46 # 管理员id，后期通过封装好的函数参数获取

new_request.check_csv("data.csv", values)

var db = db_connector.start()
db.exec("DELETE FROM places;") # 清空地点信息表
db.exec("DELETE FROM propertys;") # 清空物品信息表
db.exec("DELETE FROM request_tb;") # 清空申请信息表

foreach i in values
    new_request.single_insert(i, group_admin) # 单条录入
    runtime.delay(1000) #延迟等待一秒
end

new_request.multi_insert(values, group_admin) # 批量录入
>>>>>>> Stashed changes
