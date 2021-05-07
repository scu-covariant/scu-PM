import csv
import structs
import db_connector
import new_request

var index = {}, values = {{}}
var std = {"设备名称", "规格型号", "品牌", "维保单位", "质保期限", "是否建账", "是否可备用", "校区", "教学楼", "层数", "门牌号", "提交原因"}

var erro = csv.read_csv("data.csv",index, values)
if erro != 0
    if erro ==-1
        system.out.print("文件内容中包含英文逗号或英文双引号。\n")
        system.exit(1)
    end
    if erro == -2
        system.out.print("读取文件时出错，请检查路径是否正确。\n")
        system.exit(1)
    end
end

if array.size(index) != 12
    system.out.println("格式错误")
    system.exit(1)
end
var sub = 0
foreach i in index
    if i != std[sub]
        system.out.println("格式错误")
        system.exit(1)
    end
    sub++
end