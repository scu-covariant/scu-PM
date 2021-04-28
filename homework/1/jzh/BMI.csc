@charset:gbk
function BMIcal(height, weight)
    var BMI = weight / (height^2)
    return BMI
end
system.out.println("请输入人数：")
var n = system.in.input()
var height = new array
var weight = new array
for i = 0, i < n, i++
    system.out.println("请输入第"+(i+1)+"个人身高：")
    height[i] = system.in.input()
    system.out.println("请输入第"+(i+1)+"个人体重：")
    weight[i] = system.in.input()    
end
for i = 0, i < n, i++
    var BMI = BMIcal(height[i], weight[i])
    if BMI < 18.5
        system.out.println("第"+(i+1)+"个人BMI指数为："+BMI+"，属于偏瘦")
    end
    if BMI >= 18.5 and BMI <= 23.9
        system.out.println("第"+(i+1)+"个人BMI指数为："+BMI+"，属于正常")
    end
    if  BMI > 23.9
        system.out.println("第"+(i+1)+"个人BMI指数为："+BMI+"，属于偏重")
    end
end
