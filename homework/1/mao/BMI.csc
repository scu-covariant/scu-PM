@charset:gbk
using system 
out.print("the number of the people")
var n=in.input()
var b=new array
for i=1 ,i<=n ,i++
    out.print("your height\n")
    var height=new number
    height=in.input()
    out.print("your weight\n")
    var weight=in.input()
    var BMI=weight/(height*height)
    b.push_back(BMI)
end
for i=0 ,i<n ,i++
    out.print(b[i]+"\n")
end

   