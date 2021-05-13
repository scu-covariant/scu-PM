import imgui
import new_request
import imgui_font

system.file.remove("./imgui.ini")

# 提交新物品信息界面
function new_req(req_opened,app)
    if req_opened
        var ropen = true
        imgui.begin_window("提交新物品信息",ropen,{})
        imgui.set_window_pos(imgui.vec2(0,0))
        imgui.set_window_size(imgui.vec2(app.get_window_width(),app.get_window_height()))
        imgui.text("请选择")
        if imgui.button("单条录入##single")
            sin_opened = true
        end
        imgui.same_line()
        if imgui.button("通过文件导入##file")
            file_in(1)
        end
        imgui.same_line()
        if imgui.button("返回##back")
            req_opened = false
        end
        imgui.end_window()

    end
end


# 单条录入界面
function single(sin_opened)
    if sin_opened
        var sopen = true
        var eq_name = ""
        var eq_type = ""
        var brand = ""
        var wbdw = ""
        var start_time = ""
        var time_limit = ""
        var sfjz = ""
        var is_available = ""
        var dd_first = ""
        var dd_second = ""
        var dd_third = ""
        var dd_fourth = ""
        var reason = ""
        imgui.begin_window("单条录入",sopen,{})
        imgui.set_window_pos(imgui.vec2(0,0))
        imgui.set_window_size(imgui.vec2(app.get_window_width(),app.get_window_height()))
        imgui.set_window_focus()
        imgui.text("设备名称")
        imgui.input_text("##eq_name", eq_name, 10)
        imgui.text("规格型号")
        imgui.input_text("##eq_type", eq_type, 10)
        imgui.text("品牌")
        imgui.input_text("##brand", brand, 10)
        imgui.text("维保单位")
        imgui.input_text("##wbdw", wbdw, 10)
        imgui.text("质保期限")
        imgui.input_text("##time_limit", time_limit, 10)
        imgui.text("是否建账")
        imgui.input_text("##sfjz", sfjz, 10)
        imgui.text("是否可备用")
        imgui.input_text("##is_available", is_available, 10)
        imgui.text("校区")
        imgui.input_text("##dd_first", dd_first, 10)
        imgui.text("教学楼")
        imgui.input_text("##dd_second", dd_second, 10)
        imgui.text("层数")
        imgui.input_text("##dd_third", dd_third, 10)
        imgui.text("门牌号")
        imgui.input_text("##dd_fourth", dd_fourth, 10)
        imgui.text("提交原因")
        imgui.input_text("##reason", reason, 10)
        if imgui.button("提交##hand")
            suc_opened = true
        end
        imgui.same_line()
        if imgui.button("完成##finish")
            sin_opened = false
        end
        imgui.end_window() 
    end
end


function submit_succeed(suc_opened)
    if suc_opened
        var sucopen = true
        imgui.begin_window("提交成功",suc_opened,{})
        imgui.set_window_pos(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.30))
        imgui.set_window_size(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.35))
        imgui.set_window_focus()
        imgui.text("提交成功")
        if imgui.button("确定##suasdasd")
            system.out.print("asd")
            suc_opened = false
        end
        imgui.end_window()
    end
end

function submit_fail(fail_opened)
    if suc_opened
        var sucopen = true
        imgui.begin_window("提交成功",suc_opened,{})
        imgui.set_window_pos(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.30))
        imgui.set_window_size(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.35))
        imgui.set_window_focus()
        imgui.text("提交成功")
        if imgui.button("确定##suasdasd")
            system.out.print("asd")
            suc_opened = false
        end
        imgui.end_window()
    end
end


# function auto_close(auto_clo,opened_window,times)
#     if auto_clo
#         auto_clo = false
#         var stop_time = times * 1000
#         runtime.delay(stop_time) #延迟等待五秒
#         opened_window = false
#         times = 0
#     end
# end

var app = imgui.window_application(imgui.get_monitor_width(0)*0.5,imgui.get_monitor_height(0)*0.5,"测试窗口")

var font=imgui.add_font_extend_cn(imgui_font.source_han_sans, 20)
imgui.set_font_scale(1.5)

var sin_opened = false
var suc_opened = false
var opened_window = ""
var times = 0
var auto_clo = false



while !app.is_closed()
    app.prepare()
    imgui.push_font(font)
    # auto_close(auto_clo,opened_window,times)
    new_req(true,app)
    single(sin_opened)
    submit_succeed(suc_opened)
    imgui.pop_font()
    app.render()
end