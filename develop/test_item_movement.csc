import db_connector
import item_movement
import imgui
import imgui_font
import item_movement_gui 
system.file.remove("./imgui.ini")
using imgui
var window_opened=true
var account = 1

var app=window_application(0.5*imgui.get_monitor_width(0),0.5*imgui.get_monitor_height(0),"申请界面")
var font=add_font_extend_cn(imgui_font.source_han_sans, 50)
set_font_scale(0.5)
var a=true
while !app.is_closed()
    app.prepare()
    style_color_light()
    push_font(font)
    
    item_movement_gui.start(account,window_opened,app)
    
    
    pop_font()
    app.render()
end 