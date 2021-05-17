import hello
import imgui
import imgui_font
using imgui
system.file.remove("./imgui.ini")
var app=window_application(get_monitor_width(0)*0.75,get_monitor_height(0)*0.75,"开发样例")
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
var window_opened = true
set_font_scale(1.2) 
while !app.is_closed()
    app.prepare()
    push_font(font)
    if window_opened
        hello.generate(window_opened)
        var a ={ "1","2","3"}
        var c1 = combo_box("筛选", 3,a )
    end
    pop_font()
    app.render()
end



var w2_state = false
        var w3_state = false
        var w4_state = false
        switch select_kind
            case 0
                w2_state = true
            end
            case 1
                w3_state = true
            end
            case 2
                w4_state = true
            end
        end
