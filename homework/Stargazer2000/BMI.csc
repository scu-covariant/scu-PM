using system
var people_num=new number
var person_info=new array
# var person_BMI=new array
out.print("please input people number:")
people_num=in.input();
for i=0,i<people_num*2,i+=2
    out.print("please input NO."+(i/2+1)+" person height:")
    person_info[i]=in.input();
    out.print("please input NO."+(i/2+1)+" person weight:")
    person_info[i+1]=in.input();
end
for i=0,i<people_num*2,i+=2
    var BMI=person_info[i+1]/(person_info[i]*person_info[i])
    var sort=""
    if BMI<20
        sort="thin"
    end
    if BMI>20&&BMI<25
        sort="normal"
    end
    if BMI>25
        sort="overwhight"
    end
    out.println("the NO."+(i/2+1)+" person BMI is:"+BMI+" belong to "+sort)
end