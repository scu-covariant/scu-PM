import imgui
import imgui_font
import db_connector
import review_commit
var db = db_connector.start()
using imgui

system.file.remove("./imgui.ini")
var app=window_application(get_monitor_width(0),get_monitor_height(0),"四川大学物资管理系统")
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
var account = "Mike"
var password = "123456"
var job = 0
var if_campus_manager = false
var if_group_manager = false
var if_login_window = true
var if_review_commit = false
set_font_scale(1.0) 
function identity(account,pass)
    var stmt = db.prepare("select account, pass, job from all_user where account=? and pass=?")
    stmt.bind(0,account)
    stmt.bind(1,pass)
    var res = stmt.exec()
    system.out.println(res)
    if res.size == 0
        return 0
    else 
        if res[0][2].data == "1"
            return 1
        else
            if res[0][2].data == "2"
                return 2
            end
        end
    end
end

function campus_manager()
    begin_window("校区管理员界面",if_campus_manager,{flags.no_collapse,flags.no_move,flags.no_resize})
    if button("通过待审核的信息##commit")
        review_commit.read_db()
        if_review_commit = true
    end
    end_window()
end
while !app.is_closed()
    app.prepare()
        style_color_light()
        push_font(font)
        if if_login_window
            begin_window("登录",if_login_window,{flags.no_collapse,flags.no_move,flags.no_resize})
                set_window_size(vec2(get_monitor_width(0) / 2,get_monitor_height(0) / 2))
                set_window_pos(vec2(get_monitor_width(0) / 4,get_monitor_height(0) / 4 ))
                input_text("账户",account,30)
                input_text_s("密码",password,30,{flags.password})
                if button("登录##login")
                    switch identity(account,password)
                        case 1
                            if_campus_manager = true
                            if_login_window = false
                        end
                    end
                end
            end_window()
        end
        if if_campus_manager
            campus_manager()
        end
        if if_review_commit
            review_commit.begin_review_commit_window(account,if_review_commit)
        end
        pop_font()    
        app.render()
end