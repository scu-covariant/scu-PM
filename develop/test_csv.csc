import csv

var index = {}, values = {{}}

var erro = csv.read_csv("",index, values)
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

foreach it in index
    system.out.print(it+' ')
end
system.out.print('\n')

foreach it in values
    foreach value in it
        system.out.print(value+' ')
    end
    system.out.print('\n')
end

csv.write_csv("write_result.csv",index, values)