@charset:gbk
class shape
    var name = new string
    var mianji = new number
    function getmianji()
        return
    end
end

class circle extends shape
    var radius = new number
    function getmianji() override
        return 3.14*(radius^2)
    end
end
var c1 = new circle
c1.name = "circle"
c1.radius = 3
c1.mianji = c1.getmianji()
system.out.println(c1.name)
system.out.println(c1.radius)
system.out.println(c1.mianji)