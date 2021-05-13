import mywindow
import imgui
import mydb

var sub_window = false
var judge = new number

var app1 = new mywindow.App

var content = new string
var pass = new string

var win_is_open = true

while !app1.app.is_closed()
    app1.app.prepare()
    imgui.push_font(app1.font)
    
    var window1 = new mywindow.Window

    imgui.input_text("用户名##username",content,20)
    imgui.input_text_s("密码##password",pass,20,{imgui.flags.password})

        if imgui.button("登录##log")
            sub_window = true
        end

        if sub_window
            imgui.begin_window("用户",win_is_open,{})
            imgui.same_line()
            imgui.set_window_pos(imgui.vec2(imgui.get_monitor_width(0)*0.17,imgui.get_monitor_height(0)*0.15))
            imgui.set_window_size(imgui.vec2(300,300))
            # window2.setPostion(200,200)
            # window2.setSize(300,300)
            switch  mydb.login(content, pass)
                case 0
                    imgui.text("恭喜, 登录成功")
                end
                case 1
                    imgui.text("用户名不存在")
                end
                case 2
                    imgui.text("密码错误")
                end
            end

            imgui.set_window_focus()

            if imgui.button("确定##sure") or win_is_open == false
                sub_window = false
            end
            imgui.end_window()
        end

    imgui.pop_font()
    imgui.end_window()
    app1.app.render()
end

system.out.print("您关闭了窗口")