import mydb as db
using system
var name = to_string(in.input())
var pass = to_string(in.input())
var flag = db.login(name,pass)
switch flag
    case 0
        out.print("密码正确！")
    end
    case 1
        out.print("用户不存在")
    end
    case 2
        out.print("密码错误！")
    end
end
