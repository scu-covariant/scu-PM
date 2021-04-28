@charset:gbk
using system 
class shape
    var  square=0
    var  name=0 
end
class circle extends shape 
    var r=0
    function  cal_circle_square(  )
        return 3.14*this.r*this.r
        
    end
end
var circle1=new circle
circle1.r=5

out.print(circle1.cal_circle_square())
