import time_base64 as t
import codec.base64.standard as base64
import codec.json as json
system.out.println(t.get_time_str(runtime.utc_time()))

#转换为时间码
system.out.println(t.to_timestamp(runtime.utc_time()))
var a = t.to_timestamp(runtime.local_time())
var b = t.from_timestamp(a)
var p = system.out.println
p(t.timestamp2string(a))
foreach i in b
    p(i.first+' '+i.second)    
end
