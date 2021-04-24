using system
class shapes
    var name = "", area = 0.0
    function initialize()
    end
    function cal_area()
    end
end

class round extends shapes
    var radius = 0.0, diameter = 0.0

    function initialize() override
        parent.name = "default"
    end

    function init(name_, radius_) override
        parent.name = name_, radius = radius_, diameter = radius*2
    end

    function cal_area() override
        parent.area = 3.1415926*(radius)^2
        return parent.area
    end
end

function main()
    var round_1 = new round, round_2 = new round
    round_2.init("round no.2", 5)
    out.print(round_1.name); out.print(" "); out.print(round_1.area)
    out.print(" "); out.print(round_1.radius); out.print(" ")
    out.print(round_1.diameter); out.print("\n")

    out.print(round_2.name); out.print(" "); out.print(round_2.area)
    out.print(" "); out.print(round_2.radius); out.print(" ")
    out.print(round_2.diameter); out.print("\n")

    round_2.cal_area()

    out.print(round_2.name); out.print(" "); out.print(round_2.area)
    out.print(" "); out.print(round_2.radius); out.print(" ")
    out.print(round_2.diameter); out.print("\n")
    return
end

main()