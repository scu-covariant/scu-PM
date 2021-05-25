import review_commit
import db_connector
import imgui
import imgui_font 
using system
using imgui
system.file.remove("./imgui.ini")
var app=window_application(get_monitor_width(0),get_monitor_height(0),"测试窗口")
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
var window_opened=true
var if_review_commit=false
set_font_scale(1.2)
review_commit.read_db()
while !app.is_closed()
    app.prepare()
    push_font(font)
    begin_window("测试1##open",window_opened,{})
        if(!window_opened)
        break
        end
        set_window_pos(vec2(0,0))
        set_window_size(vec2(get_monitor_width(0),get_monitor_height(0)))
        if(button("审核##asd"))
            if_review_commit=true
        end
        if(if_review_commit)
        review_commit.begin_review_commit_window("0",if_review_commit)
        end
    pop_font()
    end_window()
    app.render()
end