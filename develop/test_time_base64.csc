import time_base64 as t
import codec.base64.standard as base64
import codec.json as json
# 下面这行用处不大，函数已经注释掉了（说不定以后有用）
# system.out.println(t.get_time_str(runtime.utc_time()))

#转换为时间码
system.out.println(t.to_timestamp(runtime.utc_time()))
var a = t.to_timestamp(runtime.local_time())
var b = t.from_timestamp(a)
var p = system.out.println

p(t.timestamp2string(a))
foreach i in b
    p(i.first+' '+i.second)    
end

## 直接调用时间戳生成函数,并利用解码器解码
var loc_stp = t.get_local_timestamp()
p(loc_stp.size)                    # 时间戳大小为108个字符
var utc_stp = t.get_utc_timestamp()
p("时间戳长度为："+ utc_stp.size)
p(t.timestamp2string(loc_stp))
p(t.timestamp2string(utc_stp))
# 数据库中只存储时间戳
##
# 年是到1900年的年，mon是月份本身，day是日期，hour是当前小时24小时制，min是分，sec是秒
var mytime = t.mytime_to_timestamp(2050-1900,11,22,6,32,45)
p(t.timestamp2string(mytime))

# 比较时间戳长短的函数
# 如果前面的发生的早，则返回true，否则返回false
p(t.lessThan(t.get_utc_timestamp(),t.get_local_timestamp()))