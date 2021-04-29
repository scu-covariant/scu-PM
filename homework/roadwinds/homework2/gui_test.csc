import imgui
import imgui_font
import mydb as db
using imgui
system.file.remove("./imgui.ini")

var app=window_application(0.5*get_monitor_width(0),0.5*get_monitor_height(0),"test")
var font=add_font_extend_cn(imgui_font.source_han_sans,32)
set_font_scale(1)
var check_result="",name = "",pass = "",str = "登录",check_flag = false,result_window = true
function print()
    begin_window("提示",result_window,{flags.no_collapse})
    set_window_size(vec2(0.25*get_monitor_width(0),0.25*get_monitor_height(0)))
    text(check_result)
    if button("确认")
        result_window = false
        check_flag=false
    end
    end_window()
end
var window_opened=true
while !app.is_closed()
    app.prepare()
        style_color_dark()
        push_font(font)
        begin_window("登录系统",window_opened,{})
        if !window_opened
            break
        end
        input_text("用户名##name", name ,10)
        input_text_s("密码##pass", pass ,10,{flags.password})
        set_window_pos(vec2(0,0))
        set_window_size(vec2(0.5*get_monitor_width(0),0.5*get_monitor_height(0)))
        if button(str)
            check_flag=true
            var flag = db.login(name,pass)
            switch flag
                case 0
                    check_result="密码正确！登录成功"
                end
                case 1
                    check_result="用户不存在"
                end
                case 2
                    check_result="密码错误！"
                end
            end
        end
        if check_flag
            print()
        end
        pop_font()
        end_window()
        app.render()
end