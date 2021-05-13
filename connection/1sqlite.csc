import csdbc_sqlite
import imgui
import imgui_font
var db = csdbc_sqlite.open("./PM.db")
function add(name,mayjor,gender)
    # statement的缩写，表示即将输入数据库的sql语句
    # testtb 的字段分别为 id-姓名-专业-性别
    var stmt = db.prepare("INSERT INTO testtb(uuid,name,value) values(?,?,?)")
    # prepare是准备一条可以使用的sql语句，可以使用？作为匹配（类比printf）
    stmt.bind(0,name)
    stmt.bind(1,mayjor)
    stmt.bind(2,gender)
    # 以上是将信息与对应的？绑定
    # 以下执行准备好的sql语句
    stmt.just_exec()
    # just_exec是立即执行，没有返回值，而exec是有返回值的，一般用于查询
end
using imgui
# 因为每次执行都会生成对应文件，为防止相互影响，先删除改文件。
system.file.remove("./imgui.ini")

var res = new array
var selected = new hash_map

function read_db()
    res = db.exec("select * from testtb")
    selected.clear()
    foreach i in range(res.size)
        selected[to_string(res[i][0].data)] = false
    end
end

function a_result(text,flag)
    check_box(text,flag)
end
function post_res()
    begin_window("渲染窗体",window_opened,{})
    foreach i in range(res.size)
        a_result(res[i][0].data,selected[to_string(res[i][0].data)])
    end
    end_window()
end

var window_opened=true
var rend_show = false
var app=window_application(get_monitor_width(0),get_monitor_height(0),"测试窗口")
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
set_font_scale(1.2) 
while !app.is_closed()
    app.prepare()
        style_color_light()
        push_font(font)
        begin_window("测试窗体",window_opened,{flags.no_title_bar})
        if !window_opened
            break
        end
        text("你好世界")
        set_window_size(vec2(150,200))
        if button("获取信息##1") 
            read_db()
            system.out.println(selected)
        end
        if button("渲染##2")
            rend_show = true
        end
        if rend_show == true
            post_res()
        end
        pop_font()
        end_window()
        app.render()
end