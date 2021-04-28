using system
class shape
    var name=new number
    var area=new number
    function get_area()
    end
end 
class circle extends shape
    var pai=3.14
    var r=new number
    function get_area() override
        out.print ("The area of circle is: "+pai*r*r)
    end
end
var circle1=new circle
out.print("input r:")
circle1.r=in.input()
circle1.get_area()