class Shape
    #变量
    var name = new string
    var square = new number

    #函数
    function initialize()
    end
    function getSquare()
    end
    function getName()
    end
end

class Circle extends Shape
    #变量
    var radius = new number

    #函数
    function setName(name)
        this.name = name
    end
    function initialize() override
        this.name= "circle"
    end
    function init(R)
        this.radius = R
    end
    function getName() override
        return this.name
    end
    function getSquare() override
        return (this.radius * this.radius * 3.1415926)
    end
    function getRidius()
        return this.radius
    end
end

function main()
    var circleA = new Circle
    circleA.setName("circleA")
    circleA.init(20)
    system.out.println(circleA.getName() + "的半径为:" + circleA.getRidius() + ", 面积为" + circleA.getSquare())
end

main()