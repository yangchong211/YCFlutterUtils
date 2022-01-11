

import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/date/data_formats.dart';
import 'package:yc_flutter_utils/date/date_utils.dart';

class DatePage extends StatefulWidget {

  DatePage();

  @override
  State<StatefulWidget> createState() {
    return new _DatePageState();
  }
}

class _DatePageState extends State<DatePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = new DateTime.now();
    return Scaffold(
      appBar: new AppBar(
        title: new Text("DateToolUtils工具类"),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new Text("获取当前毫秒值：" + DateToolUtils.getNowDateMs().toString()),
          new Text("获取现在日期字符串：" + DateToolUtils.getNowDateString().toString()),
          new Text("获取当前日期返回DateTime(utc)：" + DateToolUtils.getNowUtcDateTime().toString()),
          new Text("获取当前日期，返回指定格式：" + DateToolUtils.getNowDateTimeFormat(DateFormats.PARAM_FULL).toString()),
          new Text("获取当前日期，返回指定格式：" + DateToolUtils.getUtcDateTimeFormat(DateFormats.PARAM_Y_M_D_H_M).toString()),
          new Text("格式化日期 DateTime：" + DateToolUtils.formatDate(dateTime)),
          new Text("格式化日期 DateTime：" + DateToolUtils.formatDate(dateTime,format: DateFormats.Y_M_D_H_M)),
          new Text("格式化日期字符串：" + DateToolUtils.formatDateString('2021-07-18 16:03:10', format: "yyyy/M/d HH:mm:ss")),
          new Text("格式化日期字符串：" + DateToolUtils.formatDateString('2021-07-18 16:03:10', format: "yyyy/M/d HH:mm:ss")),
          new Text("格式化日期毫秒时间：" + DateToolUtils.formatDateMilliseconds(1213423143312, format: "yyyy/M/d HH:mm:ss")),
          new Text("获取dateTime是星期几：" + DateToolUtils.getWeekday(dateTime)),
          new Text("获取毫秒值对应是星期几：" + DateToolUtils.getWeekdayByMilliseconds(1213423143312)),
          new Text("根据时间戳判断是否是今天：" + DateToolUtils.isToday(1213423143312).toString()),
          new Text("根据时间戳判断是否是今天：" + DateToolUtils.isToday(dateTime.millisecondsSinceEpoch).toString()),
          new Text("根据时间判断是否是昨天：" + DateToolUtils.isYesterday(dateTime,dateTime).toString()),
          new Text("根据时间戳判断是否是本周：" + DateToolUtils.isWeek(1213423143312).toString()),
          new Text("根据时间戳判断是否是本周：" + DateToolUtils.isWeek(1213423143312).toString()),
          new Text("根据时间戳判断是否是本周：" + DateToolUtils.isWeek(1213423143312).toString()),
          new Text("是否是闰年：" + DateToolUtils.isLeapYear(dateTime).toString()),
          new Text("是否是闰年：" + DateToolUtils.isLeapYearByMilliseconds(1213423143312).toString()),
        ],
      ),
    );
  }
}