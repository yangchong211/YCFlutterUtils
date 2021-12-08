import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';
import 'package:yc_flutter_utils_example/tool/page/animation/animation_page.dart';
import 'package:yc_flutter_utils_example/tool/page/basic/basic_widget_page.dart';
import 'package:yc_flutter_utils_example/tool/page/callback/call_back_page.dart';
import 'package:yc_flutter_utils_example/tool/page/channel/platform_page.dart';
import 'package:yc_flutter_utils_example/tool/page/custom/custom_widget_page.dart';
import 'package:yc_flutter_utils_example/tool/page/dialog/dialog_page.dart';
import 'package:yc_flutter_utils_example/tool/page/event/event_page.dart';
import 'package:yc_flutter_utils_example/tool/page/function/function_page.dart';
import 'package:yc_flutter_utils_example/tool/page/layout/layout_widget_page.dart';
import 'package:yc_flutter_utils_example/tool/page/navigator/navigator_page.dart';
import 'package:yc_flutter_utils_example/tool/page/scroll/scroll_page.dart';
import 'package:yc_flutter_utils_example/tool/page/storage/storage_page.dart';
import 'package:yc_flutter_utils_example/tool/page/use/common_use_page.dart';
import 'package:yc_flutter_utils_example/tool/page/vessel/vessel_page.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';

class ToolHomePage extends StatefulWidget{

  ToolHomePage({Key key, this.title}) : super(key: key);
  final String title;

  //createState()来创建状态(State)对象
  @override
  State<StatefulWidget> createState() {
    return new ToolHomePageState();
  }

}

class ToolHomePageState extends State<ToolHomePage>{


  @override
  void initState() {
    super.initState();
    LogUtils.init(tag : "yc",isDebug: true , maxLen: 128);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //在构建页面时，会调用组件的build方法
  //widget的主要工作是提供一个build()方法来描述如何构建UI界面
  //通常是通过组合、拼装其它基础widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(this.widget.title),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            CustomRaisedButton(new BasicWidgetPage("充哥"), "基础类widget"),
            CustomRaisedButton(new LayoutWidgetPage(), "布局类widget"),
            CustomRaisedButton(new VesselWidgetPage(), "容器类widget"),
            CustomRaisedButton(new CommonUsePage(), "Scaffold脚手架"),
            CustomRaisedButton(new ScrollPage(), "可滚动widget"),
            CustomRaisedButton(new FunctionPage(), "功能型组件"),
            CustomRaisedButton(new CustomWidgetPage(), "自定义widget"),
            CustomRaisedButton(new DialogPage(), "弹窗和吐司"),
            CustomRaisedButton(new EventPage(), "事件处理和通知"),
            CustomRaisedButton(new AnimationPage(), "动画处理"),
            CustomRaisedButton(new PlatformPage(), "平台调用"),
            CustomRaisedButton(new CallBackPage(), "页面跳转后回调"),
            CustomRaisedButton(new StoragePage(), "数据库操作"),
            CustomRaisedButton(new NavigatorPage(), "路由页面跳转"),
          ],
        ),
      ),
    );
  }

}

