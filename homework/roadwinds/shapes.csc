class Shapes
    var name = ""
    var S = 0
    function getS()
            
    end
end
class Circle extends Shapes
    var pi=3.14
    var r = new number
    function getS() override
        system.out.println("The area of this circle is " + ( pi*(r^2) ) )
    end
    function getC()
        system.out.println("The grith of this ciecle is " + (2*pi*r))
    end
end
system.out.print("Please input the r of a circle ")
var circle = new Circle
circle.r = system.in.input()
circle.getC()
circle.getS()