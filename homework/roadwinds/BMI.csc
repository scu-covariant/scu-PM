@charset:gbk
var n = new number 
var bmi = new array
system.out.print(">>请输入人数")
n = system.in.input()
for i=0,i<n,i++
	system.out.print(">>第"+(i+1)+"个人的身高为：")
	var h=system.in.input()
	system.out.print(">>第"+(i+1)+"个人的体重为：")
	var w=system.in.input()
	bmi[i]=w/(h^2)
end
for i=0,i<n,i++
	if bmi[i]<18.5
		system.out.println("第"+(i+1)+"个人的BMI为："+bmi[i]+",属于偏瘦")
	end
	if bmi[i]>=18.5&&bmi[i]<=23.9
		system.out.println("第"+(i+1)+"个人的BMI为"+bmi[i]+",属于正常")
	end
	if bmi[i]>23.9
		system.out.println("第"+(i+1)+"个人的BMI为"+bmi[i]+",属于偏胖")
	end
end