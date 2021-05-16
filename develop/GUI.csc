import imgui
import new_request
import structs
import imgui_font

system.file.remove("./imgui.ini")



class Single
    var eq_name = ""
    var eq_type = ""
    var brand = ""
    var wbdw = ""
    var time_limit = ""
    var sfjz = ""
    var is_available = ""
    var dd_first = ""
    var dd_second = ""
    var dd_third = ""
    var dd_fourth = ""
    var reason = ""

    var arr = new array

    function set()
        array.clear(this.arr)
        arr.push_back(this.eq_name)
        arr.push_back(this.eq_type)
        arr.push_back(this.brand)
        arr.push_back(this.wbdw)
        arr.push_back(this.time_limit)
        arr.push_back(this.sfjz)
        arr.push_back(this.is_available)
        arr.push_back(this.dd_first)
        arr.push_back(this.dd_second)
        arr.push_back(this.dd_third)
        arr.push_back(this.dd_fourth)
        arr.push_back(this.reason)
    end
end
# 全局变量

var single_arr = new Single
var req_opened = true
var sin_opened = false
var suc_opened = false
var opened_window = ""
var times = 0
var auto_clo = false
var file_opened = false
var feed_opened = false 
var erro = 0
var address = ""

# 提交新物品信息界面
function new_req(req_opened,group_admin,app)
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
            file_opened = true
        end
        imgui.same_line()
        if imgui.button("返回##back")
            req_opened = false
        end
        if ropen == false
            req_opened = false
        end
        
        single(sin_opened,group_admin)
        submit_succeed(suc_opened)
        file_in(file_opened,group_admin)
        feedback(feed_opened,erro)
        imgui.end_window()
    end
end


# 单条录入界面
function single(sin_opened,group_admin)
    if sin_opened
        var sopen = true
        imgui.begin_window("单条录入",sopen,{})
        imgui.set_window_pos(imgui.vec2(0,0))
        imgui.set_window_size(imgui.vec2(app.get_window_width(),app.get_window_height()))
        # imgui.set_window_focus()
        imgui.text("设备名称")
        imgui.input_text("##eq_name", single_arr.eq_name, 10)
        imgui.text("规格型号")
        imgui.input_text("##eq_type", single_arr.eq_type, 10)
        imgui.text("品牌")
        imgui.input_text("##brand", single_arr.brand, 10)
        imgui.text("维保单位")
        imgui.input_text("##wbdw", single_arr.wbdw, 10)
        imgui.text("质保期限")
        imgui.input_text("##time_limit", single_arr.time_limit, 10)
        imgui.text("是否建账")
        imgui.input_text("##sfjz", single_arr.sfjz, 10)
        imgui.text("是否可备用")
        imgui.input_text("##is_available", single_arr.is_available, 10)
        imgui.text("校区")
        imgui.input_text("##dd_first", single_arr.dd_first, 10)
        imgui.text("教学楼")
        imgui.input_text("##dd_second", single_arr.dd_second, 10)
        imgui.text("层数")
        imgui.input_text("##dd_third", single_arr.dd_third, 10)
        imgui.text("门牌号")
        imgui.input_text("##dd_fourth", single_arr.dd_fourth, 10)
        imgui.text("提交原因")
        imgui.input_text("##reason", single_arr.reason, 10)
        if imgui.button("提交##hand")
            single_arr.set()
            system.out.print(single_arr.arr[0])
            new_request.single_insert(single_arr.arr,group_admin)
            suc_opened = true
        end
        imgui.same_line()
        if imgui.button("完成##finish")
            sin_opened = false
        end
        if sopen == false
            sin_opened = false
        end
        imgui.end_window() 
    end
end


# 提交成功

function submit_succeed(suc_opened)
    if suc_opened
        var sucopen = true
        imgui.begin_window("提交成功",sucopen,{})
        imgui.set_window_pos(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.30))
        imgui.set_window_size(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.35))
        imgui.set_window_focus()
        imgui.text("提交成功")
        if imgui.button("确定##suasdasd")
            system.out.print("asd")
            suc_opened = false
        end
        if sucopen = false
            suc_opened = false
        end
        imgui.end_window()
    end
end

# 提交失败

function submit_fail(fail_opened)
    if fail_opened
        var failopen = true
        imgui.begin_window("提交失败",failopen,{})
        imgui.set_window_pos(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.30))
        imgui.set_window_size(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.35))
        imgui.set_window_focus()
        imgui.text("提交失败")
        if imgui.button("确定##suasdasd")
            system.out.print("asd")
            suc_opened = false
        end
        if failopen = false
            fail_opened = false
        end
        imgui.end_window()
    end
end


# 通过文件导入

function file_in(file_opened,group_admin)
    if file_opened
        var fileopen = true
        imgui.begin_window("通过文件导入",fileopen,{})
        imgui.set_window_pos(imgui.vec2(0,0))
        imgui.set_window_size(imgui.vec2(app.get_window_width(),app.get_window_height()))
        imgui.text("请输入文件地址")
        imgui.input_text("##address",address,50)
        imgui.same_line()

        if imgui.button("选择##choose")
            system.out.print("asd")
        end

        if imgui.button("提交##hand")
            var value = new array
            new_request.check_csv(address,value,erro)
            if erro!= 0
                feed_opened = true
            end
            if erro == 0
                new_request.multi_insert(value, group_admin)
                suc_opened = true
            end
        end
        imgui.same_line()
        if imgui.button("返回##back")
            file_opened = false
        end
        if fileopen = false
            file_opened = false
        end
        imgui.end_window()
    end
end




function feedback(feed_opened,erro)
    if feed_opened
        var feedopen = true
        imgui.begin_window("提交失败",feedopen,{})
        imgui.set_window_pos(imgui.vec2(app.get_window_width()*0.35,app.get_window_height()*0.30))
        imgui.set_window_size(imgui.vec2(app.get_window_width()*0.4,app.get_window_height()*0.4))
        imgui.set_window_focus()
        if erro == -1
        imgui.text("文件内容中包含英文逗号或英文双引号。")
        end
        if erro == -2
            imgui.text("读取文件时出错，请检查路径是否正确。")
        end
        if erro == -3
            imgui.text("格式错误，表格应该为12列。")
        end
        if imgui.button("确定##suasdasd")
            feed_opened = false
        end
        if feedopen = false
            feed_opened = false
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


var group_admin = 196


while !app.is_closed()
    app.prepare()
    imgui.push_font(font)
    # auto_close(auto_clo,opened_window,times)
var group_admin = 196
    new_req(true,group_admin,app)
    
    imgui.pop_font()
    app.render()
end