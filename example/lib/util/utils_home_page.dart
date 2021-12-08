

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yc_flutter_utils/i18/localizations.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';
import 'package:yc_flutter_utils_example/util/utils/bus_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/byte_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/color_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/data_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/encrypt_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/extension_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/file_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/get_it_page.dart';
import 'package:yc_flutter_utils_example/util/utils/i18_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/image_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/json_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/log_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/num_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/object_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/other_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/parser_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/polling_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/regex_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/screen_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/sp_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/state_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/storage_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/system_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/text_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/timer_utils_page.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';

class UtilsHomePage extends StatefulWidget{

  UtilsHomePage({Key key, this.title}) : super(key: key);
  final String title;

  //createState()来创建状态(State)对象
  @override
  State<StatefulWidget> createState() {
    return new UtilsHomePageState();
  }

}

class UtilsHomePageState extends State<UtilsHomePage>{


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
    return MaterialApp(
      // 本地化的代理类
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //支持的语言
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(this.widget.title),
        ),
        body: new Center(
          child: new ListView(
            children: <Widget>[
              CustomRaisedButton(new BusPage(), "EventBus 事件通知工具类"),
              CustomRaisedButton(new GetItPage(), "serviceLocator测试"),
              CustomRaisedButton(new LogUtilsPage(), "LogUtils 日志工具类"),
              CustomRaisedButton(new DatePage(), "DateUtils 日期工具类"),
              CustomRaisedButton(new JsonUtilsPage(), "JsonUtils Json工具类"),
              CustomRaisedButton(new FileStoragePage(), "FileUtils 文件工具类"),
              CustomRaisedButton(new EncryptPage(), "EncryptUtils 加解密工具类"),
              CustomRaisedButton(new ObjectPage(), "ObjectUtils Object工具类"),
              CustomRaisedButton(new TextPage(), "TextUtils 文本工具类"),
              CustomRaisedButton(new ScreenPage(), "ScreenUtils 屏幕工具类"),
              CustomRaisedButton(new I18Page(), "I18 国际化工具类"),
              CustomRaisedButton(new NumPage(), "NumUtils 格式处理工具类"),
              CustomRaisedButton(new ColorPage(), "ColorUtils 颜色工具类"),
              CustomRaisedButton(new ImagePage(), "ImageUtils 图片工具类"),
              CustomRaisedButton(new TimerPage(), "TimerUtils 计时器工具类"),
              CustomRaisedButton(new RegexPage(), "RegexUtils 正则校验工具类"),
              CustomRaisedButton(new StoragePage(), "StorageUtils 文件管理工具类"),
              CustomRaisedButton(new ExtensionPage(), "extension_xx 拓展工具类"),
              CustomRaisedButton(new SpPage(), "SpUtils sp存储工具类"),
              CustomRaisedButton(new ParserPage(), "MarkupUtils 解析xml/html工具类"),
              CustomRaisedButton(new SystemPage(), "SystemUtils 系统工具类"),
              CustomRaisedButton(new BytePage(), "Byte 字节工具类"),
              CustomRaisedButton(new PollingPage(), "TaskQueueUtils 队列工具类"),
              CustomRaisedButton(new StatePage(), "PageBaseState 状态切换管理"),
              CustomRaisedButton(new StatePage(), "MVP 案例时间展示"),
              CustomRaisedButton(new OtherPage(), "其他一些工具类"),
            ],
          ),
        ),
      ),
    );
  }

}
