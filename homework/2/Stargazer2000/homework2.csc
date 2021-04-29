import mydb as db
import imgui
import imgui_font 
using system
using imgui
system.file.remove("./imgui.ini")
function show(a)
    var window_opened2=true
    set_next_window_pos(vec2(350,200))
    set_next_window_focus()
    set_next_window_size(vec2(200,200))
    begin_window("##t",window_opened2,{})
    switch a
        case 0
            text("密码正确！")
        end
        case 1
            text("用户不存在！")
        end
        case 2
            text("密码错误！")
        end
    end
    if button("关闭##close")||!window_opened2
        flag=-1
    end
    end_window()
end
var app=window_application(0.5*get_monitor_width(0),0.5*get_monitor_height(0),"测试窗口")
var window_opened=true
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
set_font_scale(1.2)
var name=""
var pass=""
var flag=-1
while !app.is_closed()
    app.prepare()
    push_font(font)
    begin_window("欢迎使用登录系统##t",window_opened,{})
        if !window_opened
            break
        end
        set_window_pos(vec2(0,0))
        set_window_size(vec2(get_monitor_width(0)*0.5,get_monitor_height(0)*0.5))
        input_text("账号##name", name, 20)
        input_text_s("密码##pass", pass, 20,{flags.password})
        if button("登录##log")
            flag = db.login(name,pass)
        end
        if flag!=-1
            show(flag)
        end
        pop_font()
    end_window()
    app.render()
end