import imgui
import imgui_font
using imgui

system.file.remove("./imgui.ini")

var monitor_w = get_monitor_width(0)
var monitor_h = get_monitor_height(0)
var app=window_application(get_monitor_width(0),get_monitor_height(0),"测试表格和各个控件的衔接")

# fonts
var font=add_font_extend_cn(imgui_font.source_han_sans, 32)
var large_font = add_font_extend_cn(imgui_font.source_han_sans, 54)
var tiny_font = add_font_extend_cn(imgui_font.source_han_sans,18)
set_font_scale(1.0)

# window size !!!!!!!！！注意！后续的你们所有的操作窗口按照这个标准来！！！！
var operating_window_size = vec2(to_integer(monitor_w/4*3),to_integer(monitor_h/8*7))
var operating_window_location = vec2(to_integer(monitor_w/4),to_integer(monitor_h/8))


# window status
var if_mywindow = true

#data cache 处理数据的地方
namespace data
    # 数据本身
    var info = new array
    # 字段列表
    var tag = {"姓名","成绩a","成绩b","年龄","身材","长度"}
    # 控制升降序
    var stat = {true,true,true,true,true,true}
    # generate info
    function init_info()
        foreach i in range(10)
            var tmp = new hash_map
                tmp.insert(data.tag[0] , "马晓晨"+ to_string(i) )
            foreach j in range(1,6,1)
                tmp.insert(data.tag[j],math.randint(1,100))
            end
            data.info.push_back(tmp)
        end
    end
    # 利用lambda表达式，根据flag和下标进行的排序操作，通过flag控制升降序
    function info_sort(idx,flag)
        if flag
            data.info.sort([](a,b)->a[data.tag[idx]] < b[data.tag[idx]] )
        else
            data.info.sort([](a,b)->a[data.tag[idx]] > b[data.tag[idx]] )
        end
    end
end

function mywindow()
    begin_window("审核提交##choose",if_mywindow,{flags.no_resize,flags.no_move,flags.no_collapse})
    set_window_size(operating_window_size)
    set_window_pos(operating_window_location)
    var length = data.info.size
    var width = data.tag.size
    var opened = false
        # 表格化主要由本控件实现：
        columns(width,"",true)
        # 渲染第一排和排序
        foreach i in range(data.tag.size)
            text(data.tag[i])
            same_line()
            if button("排序##sort" + data.tag[i])
                data.info_sort(i,data.stat[i])
                data.stat[i] = !data.stat[i]
            end
            next_column()
        end
        # 渲染之后的数据
        foreach i in range(length)
            foreach j in range(width)
                if get_column_index()==0
                    # 每一行都要添加分割，不然就没有“横线”
                    separator()
                end
                # 注意这里要to_string
                opened = false
                # 主要的显示控件，我这里因为有进一步需求，所以用的selectable
                # 如果没有进一步需求，用text()可以减小开销！！！！！！！！！！！！！！！！！！！！！！！！！
                selectable(to_string(data.info[i][data.tag[j]]),opened)
                # 切换到下一列继续渲染
                next_column()
            end
        end
        separator()
    end_window()
end


# 测试data内的排序功能是否正常
# loop 
#     data.info_sort(system.in.input(),true)
#     foreach i in data.info
#         system.out.println(i)
#     end
# end

# 初始化数据
data.init_info()
system.out.println(data.info)
# 渲染逻辑
while !app.is_closed()
    app.prepare()
        style_color_light()
        push_font(font)
        if if_mywindow == true
            mywindow()
        end
        pop_font()    
    app.render()
end