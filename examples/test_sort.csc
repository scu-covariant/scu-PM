
var info = new array
var tag = {"姓名","成绩a","成绩b","年龄","身材","长度"}
# generate info
function init_info()
    foreach i in range(10)
        var tmp = new hash_map
        tmp.insert(tag[0] , "马晓晨"+ to_string(i) )
        foreach j in range(1,6,1)
            tmp.insert(tag[j],math.randint(1,100))
        end
        info.push_back(tmp)
    end
end
init_info()
foreach i in info
    system.out.println(i)
end
function mywindow()
    begin_window("审核提交##choose",if_mywindow,{})
    set_window_size(vec2(720,540))
        columns(5,"",true)
        var opened=true
        system.out.println(range(5))
        foreach i in range(5)
            foreach j in range(5)
                selectable("dick",opened)
                next_column()
            end
            separator()
        end
    end_window()
end

function info_sort(idx,flag)
    if flag
        info.sort([](a,b)->a[tag[idx]] < b[tag[idx]] )
    else
        info.sort([](a,b)->a[tag[idx]] > b[tag[idx]] )
    end
end
loop 
    sort(system.in.input())
    foreach i in info
        system.out.println(i)
    end
end