import csv
import structs
import db_connector
import new_request
import imgui
import imgui_font
using imgui
system.file.remove("./imgui.ini")
var group_admin = 46 # 管理员id，后期通过封装好的函数参数获取

var app=window_application(get_monitor_width(0),get_monitor_height(0),"测试表格和各个控件的衔接")

# fonts
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
var large_font = add_font_extend_cn(imgui_font.source_han_sans, 54)
var tiny_font = add_font_extend_cn(imgui_font.source_han_sans,18)
set_font_scale(1.0)

while !app.is_closed()
    app.prepare()
    push_font(font)
    new_request.start(group_admin,app)
    pop_font()
    app.render()
end
