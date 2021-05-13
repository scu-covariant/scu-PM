import csv
import structs
import db_connector
import new_request
import imgui
import imgui_font
using imgui
system.file.remove("./imgui.ini")

var values = new array
var uni = new array
var pros = new array
var reqs = new array
var plas = new array
var pro = new structs.property
var pla = new structs.place
var req = new structs.request
var group_admin = 46 # 管理员id，后期通过封装好的函数参数获取

new_request.find_reject(group_admin, values)

foreach i in values
    new_request.construct(i, pro, req, pla)
    var info = new array
    info.push_back(pro)
    info.push_back(req)
    info.push_back(pla)
    uni.push_back(info)
end

var app=window_application(get_monitor_width(0)*0.75,get_monitor_height(0)*0.75,"开发样例")
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
var window_opened = true
set_font_scale(1.2)
while !app.is_closed()
    app.prepare()
    push_font(font)
    if window_opened
        new_request.fix_request(group_admin, uni)
    else
        break
    end
    pop_font()
    app.render()
end

# var a = runtime.local_time()
# new_request.check_csv("data.csv", values)
# var b = runtime.local_time()

# var db = db_connector.start()
# db.exec("DELETE FROM places;") # 清空地点信息表
# db.exec("DELETE FROM propertys;") # 清空物品信息表
# db.exec("DELETE FROM request_tb;") # 清空申请信息表

# foreach i in values
#     new_request.single_insert(i, group_admin) # 单条录入
#     runtime.delay(1000) #延迟等待一秒
# end

# var c = runtime.local_time()
# new_request.multi_insert(values, group_admin) # 批量录入
# var d = runtime.local_time()
# system.out.println(a)
# system.out.println(b)
# system.out.println(c)
# system.out.println(d)

# new_request.find_reject(group_admin, values) # 查找驳回条目
# var x = 1
# foreach i in values
#     var t = x
#     to_string(t)
#     new_request.construct(i, pro, req, pla) # 构建结构体
#     var str = "修改名称", str2 = "修改原因", str3 = "修改地点"
#     str += t
#     str2 += t
#     str3 += t
#     pro.eq_name = str
#     req.reason = str2
#     pla.dd_first = str3
#     new_request.single_change(pro, req, pla) # 单条修改条目
#     x++
# end