@charset:utf8
system.out.println("请输入人数:")
var num_member = system.in.input();
var height = new array; var weight = new array; var BMI = new array;
foreach i in range(0,num_member)
    system.out.println("请输入第"+(i+1)+"个人身高:")
    height.push_back(system.in.input())
    system.out.println("请输入第"+(i+1)+"个人体重:")
    weight.push_back(system.in.input())
    BMI.push_back(weight[i] / (height[i]*height[i]))
end
foreach i in range(0,num_member)
    system.out.print("第"+(i+1)+"个人BMI指数为:"+(BMI[i])+",属于")
    if BMI[i] < 18.5
        system.out.print("偏瘦\n")
        end
    if BMI[i] > 24
        system.out.print("超重\n")
    end
    if BMI[i] >= 18.5 and BMI[i] <= 24
        system.out.print("正常\n")
    end
end