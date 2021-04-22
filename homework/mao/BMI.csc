@charset:gbk
using system 
for i=1 ,i<=3 ,i++
    out.print("your height\n")
    var height=new number
    height=in.input()
    out.print("your weight\n")
    var weight=in.input()
    var BMI=weight/(height*height)
    out.print("your BMI:"+BMI )
end
   