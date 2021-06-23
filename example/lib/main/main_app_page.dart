
import 'package:flutter/material.dart';
import 'package:yc_flutter_plugin_example/main/home_page.dart';

class MainApp extends StatelessWidget{
  //在构建页面时，会调用组件的build方法
  //widget的主要工作是提供一个build()方法来描述如何构建UI界面
  //通常是通过组合、拼装其它基础widget
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Flutter常用工具类'),
    );
  }



}

