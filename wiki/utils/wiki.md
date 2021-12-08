#### 目录介绍



### LogUtils日志打印类
```
//初始化
LogUtils.init(tag: "yc",isDebug: true,maxLen: 128);
LogUtils.d("---------onPressed-");
LogUtils.e("---------onPressed-",tag: "yangchong");

//打印日志

I/flutter: yangchong e  ---------onPressed-
```



### JsonUtils转化工具类
```
encodeObj                   : 将对象[值]转换为JSON字符串
getObj                      : 转换JSON字符串[源]到对象
getObject                   : 转换JSON字符串或JSON映射[源]到对象。
getObjList                  : 转换JSON字符串列表[源]到对象列表。
getObjectList               : 转换JSON字符串或JSON映射列表[源]到对象列表。
```


### DateUtils日期工具类
```
getDateTimeByMs                 : .
getDateMsByTimeStr              : .
getNowDateMs                    : 获取现在 毫秒.
getNowDateStr                   : 获取现在 日期字符串.(yyyy-MM-dd HH:mm:ss)
formatDate                      : 格式化日期 DateTime.
formatDateStr                   : 格式化日期 字符串.
formatDateMs                    : 格式化日期 毫秒.
getWeekday                      : 获取星期几.
getDayOfYear                    : 在今年的第几天.
isToday                         : 是否是今天.
isYesterday                     : 是否是昨天.
isWeek                          : 是否是本周.
yearIsEqual                     : 是否同年.
isLeapYear                      : 是否是闰年.


// example
DateUtils.formatDateMs(dateMs, format: DateFormats.full); //2019-07-09 16:16:16
DateUtils.formatDateStr('2019-07-09 16:16:16', format: "yyyy/M/d HH:mm:ss"); //2019/7/9 16:16:16
DateUtils.formatDate(DateTime.now(), format: DateFormats.zh_full); //2019年07月09日 16时16分16秒
```


### TimerUtils计时器工具类
```

```




