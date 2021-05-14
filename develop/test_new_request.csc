import csv
import structs
import db_connector
import new_request
import imgui
import imgui_font
using imgui
system.file.remove("./imgui.ini")

# var values = new array
# var uni = new array
# var pros = new array
# var reqs = new array
# var plas = new array
# var pro = new structs.property
# var pla = new structs.place
# var req = new structs.request
var group_admin = 46 # 管理员id，后期通过封装好的函数参数获取

var app=window_application(get_monitor_width(0)*0.75,get_monitor_height(0)*0.75,"开发样例")
var font=add_font_extend_cn(imgui_font.source_han_sans, 40)
set_font_scale(1.2)
while !app.is_closed()
    app.prepare()
    push_font(font)

    if new_request.fix_opened
        new_request.fix(group_admin)
    end

    pop_font()
    app.render()
end

# new_request.check_csv("data.csv", values)

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