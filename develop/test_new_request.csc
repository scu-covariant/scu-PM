import csv
import structs
import db_connector
import new_request

# var db = db_connector.start()
var values = {{}}

new_request.check_csv("data.csv", values)

var prop = new structs.property
var plac = new structs.place
var requ = new structs.request
var a = new array
var b = new array
var c = new array

foreach i in values
    new_request.construct(i, prop, plac, requ)
    a.push_back(prop)
    b.push_back(plac)
    c.push_back(requ)
end

var count = 0
foreach p in a
    p.iter_prepare()
    b[count].iter_prepare()
    c[count].iter_prepare()
    foreach i in p.arr
        # system.out.print(type(i))
        # system.out.print(" ")
        system.out.print(i)
        system.out.print(" ")
    end
    foreach i in b[count].arr
        # system.out.print(type(i))
        # system.out.print(" ")
        system.out.print(i)
        system.out.print(" ")
    end
    foreach i in c[count].arr
        # system.out.print(type(i))
        # system.out.print(" ")
        system.out.print(i)
        system.out.print(" ")
    end
    system.out.print("\n")
end