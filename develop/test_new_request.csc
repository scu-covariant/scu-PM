import csv
import structs
import db_connector
import new_request

var values = {{}}
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