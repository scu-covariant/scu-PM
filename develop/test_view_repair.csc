import view_repair
import imgui
import imgui_font
using imgui
system.file.remove("./imgui.ini")

var if_view_all_items = true

var app=window_application(get_monitor_width(0)*0.75,get_monitor_height(0)*0.75,"开发样例")
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
var window_opened = true
set_font_scale(1.2) 
while !app.is_closed()
    app.prepare()
    push_font(font)
    if window_opened
        view_repair.view_all_items(46,if_view_all_items)
    end
    pop_font()
    app.render()
end