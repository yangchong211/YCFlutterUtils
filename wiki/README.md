Language: [English](README-EN.md) | 中文简体


Flutter常用工具类库 [flustars][flustars_github]
2. ScreenUtil       : 屏幕适配，获取屏幕宽、高、密度，AppBar高，状态栏高度，屏幕方向.
3. WidgetUtil       : 监听Widget渲染状态，获取Widget宽高，在屏幕上的坐标，获取网络/本地图片尺寸.
4. ImageUtil        : 获取网络/本地图片尺寸.
5. DirectoryUtil    : 文件目录工具类.
6. DioUtil          : 单例Dio网络工具类(已迁移至此处[DioUtil](https://github.com/Sky24n/FlutterRepos/blob/master/base_library/lib/src/data/net/dio_util.dart))。
 




* MoneyUtil 精确转换,防止精度丢失 -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/money_page.dart)
```
changeF2Y                   : 分 转 元, format格式输出.
changeFStr2YWithUnit        : 分字符串 转 元, format 与 unit 格式 输出.
changeF2YWithUnit           : 分 转 元, format 与 unit 格式 输出.
changeYWithUnit             : 元, format 与 unit 格式 输出.
changeY2F                   : 元 转 分. 
```





* TimelineUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/timeline_page.dart)
```
///(xx)为可配置输出
enum DayFormat {
  ///(小于30s->刚刚)、x分钟、x小时、(昨天)、x天.
  Simple,
  ///(小于30s->刚刚)、x分钟、x小时、[今年: (昨天/1天前)、(2天前)、MM-dd],[往年: yyyy-MM-dd].
  Common,
  ///小于30s->刚刚)、x分钟、x小时、[今年: (昨天 HH:mm/1天前)、(2天前)、MM-dd HH:mm],[往年: yyyy-MM-dd HH:mm].
  Full,
}
///Timeline信息配置.
abstract class TimelineInfo {
  String suffixAgo(); //suffix ago(后缀 后).
  String suffixAfter(); //suffix after(后缀 前).
  int maxJustNowSecond() => 30; // max just now second.
  String lessThanOneMinute() => ''; //just now(刚刚).
  String customYesterday() => ''; //Yesterday(昨天).优先级高于keepOneDay
  bool keepOneDay(); //保持1天,example: true -> 1天前, false -> MM-dd.
  bool keepTwoDays(); //保持2天,example: true -> 2天前, false -> MM-dd.
  String oneMinute(int minutes); //a minute(1分钟).
  String minutes(int minutes); //x minutes(x分钟).
  String anHour(int hours); //an hour(1小时).
  String hours(int hours); //x hours(x小时).
  String oneDay(int days); //a day(1天).
  String days(int days); //x days(x天).
}
setLocaleInfo               : 自定义设置配置信息.
formatByDateTime            : 格式输出时间轴信息 by DateTime .
format                      : 格式输出时间轴信息.
formatA                     : 格式输出时间轴信息. like QQ.
```


### Thanks
本库部分源码参考，正则，时间轴。  
Blankj [AndroidUtilCode](https://github.com/Blankj/AndroidUtilCode) 强大易用的安卓工具类库。   
Andres Araujo [timeago](https://github.com/andresaraujo/timeago.dart) Dart时间轴库。   
a14n [decimal](https://github.com/a14n/dart-decimal) 精确运算，避免精度丢失。




