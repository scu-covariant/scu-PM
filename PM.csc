import imgui
import imgui_font
import db_connector
import review_commit
import view_repair
import new_request
import item_movement_gui
var db = db_connector.start()
using imgui

system.file.remove("./imgui.ini")
var app=window_application(get_monitor_width(0),get_monitor_height(0),"四川大学物资管理系统")
# fonts
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
var large_font = add_font_extend_cn(imgui_font.source_han_sans, 54)
var tiny_font = add_font_extend_cn(imgui_font.source_han_sans,18)
# accounts
var account = "Ora"
var password = "123456"
var user_id = 0
var job = 0
var job_map = { "1":"校区管理员","2":"小组管理员"}.to_hash_map()
# window status
var if_campus_manager = false
var if_group_manager = false

var if_login_window = true
var if_review_commit = false
var if_login_success = false
var if_view_repair = false
var if_new_request = false
var if_item_movement = false
# images
var scu_image =  load_bmp_image("images/sichuan.bmp")
var cov_image = load_bmp_image("images/cov.bmp")
var ins_image = load_bmp_image("images/ins.bmp")
# message
var pass_message = ""

#data cache
set_font_scale(1.0) 
function identity(account,pass)
    var stmt = db.prepare("select account, pass, job, uuid from all_user where account=? and pass=?")
    stmt.bind(0,account)
    stmt.bind(1,pass)
    var res = stmt.exec()
    user_id = res[0][3].data.to_number()
    system.out.println(res)
    if res.size == 0
        return 0
    else 
        job = res[0][2].data
        if res[0][2].data == "1"
            return 1
        else
            if res[0][2].data == "2"
                return 2
            end
        end
    end
end

function login_success()
    if if_login_success
        open_popup("欢迎##popup登录")
    end
    if begin_popup_modal("欢迎##popup登录",if_login_success,{flags.no_move,flags.always_auto_resize})
        text("登录成功! 欢迎您，"+ account + "，为您转到"+ job_map[job] + "界面" )
        end_popup() 
    end
end

function login_window() 
    if if_login_window
        begin_window("物资管理系统登录",if_login_window,{flags.no_collapse,flags.no_move,flags.no_resize})
            var w = 580
            var h = 800
            set_window_size(vec2(w, h))
            set_window_pos(vec2((get_monitor_width(0)-w) / 2,(get_monitor_height(0)-h) / 2))
            text(" ")
            push_font(large_font)
            text("  欢迎使用四川大学物资管理系统")
            pop_font()
            separator()
            text(" ")
            text("                ")
            same_line()
            input_text("账户",account,30)
            text("                ")
            same_line()
            input_text_s("密码",password,30,{flags.password})
            text("                " + pass_message)
            text("                                                ")
            same_line()
            if button("登录系统##login")
                switch identity(account,password)
                    case 1
                        if_campus_manager = true
                        if_login_window = false
                        if_login_success = true
                    end
                    case 2
                        if_group_manager = true
                        if_login_window = false
                        if_login_success = true
                    end
                    default
                        pass_message = "密码错误！"
                    end
                end
            end
            text(" ")
            text("                                   ") 
            same_line()
            image(scu_image,vec2(200,70))
            text(" ")
            text("                                     ") 
            same_line()
            image(cov_image,vec2(200,80))
            text(" ")
            text("                                               ") 
            same_line()
            image(ins_image,vec2(80,80))
            text("                                            ")
            same_line()  
            push_font(tiny_font)
            text("智锐科创计算机协会")
            pop_font()
        end_window()
    end
end

function campus_manager()
    if if_campus_manager
        begin_window("校区管理员界面",if_campus_manager,{flags.no_collapse,flags.no_move,flags.no_resize})
        if button("通过待审核的信息##commit")
            review_commit.read_db()
            if_review_commit = true
        end
        end_window()
    end
end

function group_manager()
    if if_group_manager
        begin_window("小组管理员界面",if_group_manager,{flags.no_collapse,flags.no_move,flags.no_resize})
        if button("浏览辖域内物品##commit")
            if_view_repair = true
        end
        if button("新物品录入##new_request_start")
            if_new_request = true
        end
        if button("同级别物品转移##item_movement")
            if_item_movement = true
        end
        end_window()
    end
end

while !app.is_closed()
    app.prepare()
        style_color_light()
        push_font(font)
        login_window()
        login_success()
        campus_manager()
        group_manager()
        # 校区管理员审核加入的物品：
        if if_review_commit
            review_commit.begin_review_commit_window(account,if_review_commit)
        end
        if if_view_repair
            view_repair.view_all_items(user_id,if_view_repair)
        end
        if if_new_request
            new_request.start(user_id,app)
        end
        if if_item_movement
            item_movement_gui.start(account,if_item_movement,app)
        end
        pop_font()    
    app.render()
end