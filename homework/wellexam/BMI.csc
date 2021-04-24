using system
var num = 0, height = 0, weight = 0, bmi = 0, count = 0
var arr = {}

out.print("请输入人数：")
num = in.input()
count = 0
while count < num
    out.print("请输入第"+(count+1)+"个人身高：（单位：cm）")
    height = in.input()
    height /= 100
    out.print("请输入第"+(count+1)+"个人体重：（单位：kg）")
    weight = in.input()
    bmi = weight/(height^2)
    arr[count] = bmi
    ++count
end
count = 0
foreach i in arr
    out.print("第"+(count+1)+"个人BMI指数为:"+i+",属于")
    if i<18.5
        out.print("偏瘦")
    else
        if i<=24
            out.print("正常")
        else
            out.print("超重")
        end
    end
    out.print("\n")
    ++count
end
