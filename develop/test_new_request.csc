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

var app=window_application(get_monitor_width(0),get_monitor_height(0),"开发样例")
var font=add_font_extend_cn(imgui_font.source_han_sans, 40)
set_font_scale(1.2)
while !app.is_closed()
    app.prepare()
    push_font(font)

    if button("录入")
        new_request.req_opened = true
    end

    text("")

    if button("修改")
        new_request.fix_opened = true
    end

    if new_request.req_opened
        new_request.new_req(group_admin,app)
    end

    if new_request.fix_opened
        new_request.fix(group_admin)
    end

    pop_font()
    app.render()
end
