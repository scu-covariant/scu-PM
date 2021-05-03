import imgui
import imgui_font
import mydb as db
using imgui

function show_log_in_res(res)
    set_next_window_pos(vec2(0,0))
    set_next_window_size(vec2(400,200))
    set_next_window_focus()
    var w2_is_open = true
              
    begin_window("log_in_res##w2",w2_is_open,{})

        switch res
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
            
        if button("exit##b2") || !w2_is_open
            res = -1
        end
    
    end_window()     
end


system.file.remove("./imgui.ini")
var app = window_application(get_monitor_width(0)*0.5,get_monitor_height(0)*0.5,"log in")
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
set_font_scale(1.2) 

var w1_is_open = true
var account_num = ""
var password = ""
var res = -1
while !app.is_closed()
    app.prepare()
        style_color_light();
        push_font(font)
        begin_window("log_in_gui##w1",w1_is_open,{flags.no_title_bar})
            set_window_size(vec2(800,300))

            if !w1_is_open
                break
            end

            input_text("account num##it1",account_num,100)
            input_text("password##it2",password,100)

            if button("login##b1")
                res = db.login(account_num,password)
            end

            if res != -1
                show_log_in_res(res)
            end
            
            pop_font()
        end_window()
    app.render()
end