import imgui
import imgui_font
import mydb as db
#import test
using imgui
system.file.remove("./imgui.ini")
var app=window_application(get_monitor_width(0),get_monitor_height(0),"用户登录界面")
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
set_font_scale(1.5) 
var window_opened=true
var window_opened1=true
var a=""
var b=""
var flag=1
var button_flag=false
while !app.is_closed()
    app.prepare()
        style_color_light()
        #设置颜色
        push_font(font)
        #第一层窗口
        begin_window("Main",window_opened,{flags.no_title_bar})
        set_window_size(vec2(1600,800))
        if !window_opened
            break
        end
        text("请输入姓名")
        input_text("姓名 ",a, 18)
        text("请输入密码")
        input_text(" 密码 ",b, 18)
        if button("确定")
            button_flag=true
            #flag = db.login(a,b)
            
        end 
        if button_flag

            begin_window("提示 ",window_opened1 ,{flags.always_auto_resize,flags.no_collapse}) 
            set_window_size(vec2(800,400))  
            if window_opened1==false
                button_flag=false
                window_opened1=true                
            end 
            flag = db.login(a,b)   
            switch flag
                case 0
                    text( "恭喜，登陆成功！")
                    end
                case 1
                    text("用户名不存在")
                end
                case 2
                    text ( "密码错误！")
                end
            end
            #spacing()
            
            set_window_pos(vec2(app.get_window_width()/4,app.get_window_height()/4))
            end_window();
            
        end
        #pop_font()
        # 弹字体栈
        end_window()
        pop_font()
        #结束窗口1
        #窗口2开始
        app.render()
end