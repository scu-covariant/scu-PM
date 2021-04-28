import mydb as db
import imgui
import imgui_font
using system
using imgui

system.file.remove("./imgui.ini")
var app=window_application(0.5*imgui.get_monitor_width(0),0.5*imgui.get_monitor_height(0),"登录界面")
var font=add_font_extend_cn(imgui_font.source_han_sans, 50)
set_font_scale(2)

var account = "", passwd = "", flag = true, feedback = "", check_if = false

function check()
    var check_window=true
    flag = db.login(account,passwd)
    switch flag
        case 0
            feedback = "恭喜，登陆成功！"
        end
        case 1
            feedback = "用户名不存在"
        end
        case 2
            feedback = "密码错误！"
        end
    end
    begin_window("提示",check_window,{flags.always_auto_resize,flags.no_collapse})
        set_window_pos(vec2(app.get_window_width()/2,app.get_window_height()/2))
        set_window_size(vec2(app.get_window_width(),app.get_window_height()))
        text(feedback)
        spacing()
        if button("确定") || is_key_pressed(to_integer('Y'))
            check_window = false
            check_if = false
        end
    end_window()
end

while !app.is_closed()
    var main_window = true
    app.prepare()
        style_color_light()
        push_font(font)
        begin_window("configure",main_window,{flags.no_resize,flags.no_move,flags.no_collapse,flags.no_title_bar})
            set_window_pos(vec2(0,22))
            set_window_size(vec2(app.get_window_width(),app.get_window_height()))
            text("欢迎来到登录界面！")
            separator()
            input_text("账户",account,128)
            separator()
            input_text("密码",passwd,128)
            separator()
            if button("登录") || is_key_pressed(get_key_index(keys.enter))
                check_if = true
            end
            if check_if
                check()
            end
        end_window()
        pop_font()
    app.render()
end

