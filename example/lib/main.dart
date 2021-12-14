import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yc_flutter_utils/i18/localizations.dart';
import 'package:yc_flutter_utils/i18/template_time.dart';
import 'package:yc_flutter_utils/locator/get_it.dart';
import 'package:yc_flutter_utils/screen/screen_adaptation_utils.dart';
import 'package:yc_flutter_utils/screen/screen_adaption.dart';
import 'package:yc_flutter_utils/sp/sp_utils.dart';
import 'package:yc_flutter_utils/state/page_change_notifier.dart';
import 'package:yc_flutter_utils/utils/flutter_init_utils.dart';
import 'package:yc_flutter_utils/except/handle_exception.dart';
import 'package:yc_flutter_utils_example/android/pages/main/android_main.dart';
import 'package:yc_flutter_utils_example/tool/page/event/provider/business_pattern.dart';
import 'package:yc_flutter_utils_example/tool/tool_home_page.dart';
import 'package:yc_flutter_utils_example/util/utils/get_it_page.dart';
import 'package:yc_flutter_utils_example/util/utils/polling_utils_page.dart';
import 'package:yc_flutter_utils_example/util/utils/service_locator.dart';
import 'package:yc_flutter_utils_example/util/utils_home_page.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';


void main() {
  //初始化工具类操作
  Future(() async {
    await FlutterInitUtils.fetchInitUtils();
  });


  AppLocalizations.supportedLocales = [
    const Locale('en', 'US'),
    const Locale('pt', 'BR'),
    const Locale('ja', 'JP'),
    const Locale('zh', 'CN'),
  ];


  //区分格式化时间
  TemplateTime.dateFormat2 = {
    "en_US": "MM-dd-yyyy",
    "pt_BR": "dd-MM-yyyy",
    "ja_JP": "yyyy/MM/dd",
    "zh_CN": "yyyy年MM月dd日",
  };
  //比如：zh_CN，表示中国
  //languageCode就是：zh
  //countryCode就是：CN
  //Locale myLocale = Localizations.localeOf(context);
  LocalizationTime.locale = new Locale("zh","CN");

  Future(() async {
    await SpUtils.init();
  });
  // 初始化屏幕适配
  ScreenAdaptationUtils.init(ScreenAdaptation.none());
  initSpi();

  //await FlutterInitUtils.fetchInitUtils();
  //FlutterInitUtils.fetchInitUtils();
  //runApp(MainApp());
  hookCrash(() {
    runApp(MainApp());
  });
}

Future initSpi() async {
  GetIt.instance.registerLazySingleton<PollingService>(() => PollingServiceImpl());
  GetIt.instance.registerLazySingleton<LocationListener>(() => LocationServiceCenterImpl());
  GetIt.instance.registerLazySingleton<BusinessService>(() => BusinessServiceImpl());
}



class MainApp extends StatelessWidget{
  //在构建页面时，会调用组件的build方法
  //widget的主要工作是提供一个build()方法来描述如何构建UI界面
  //通常是通过组合、拼装其它基础widget
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      builder: (BuildContext context, Widget child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => PageChangeNotifier()),
          ChangeNotifierProvider(create: (context) => BusinessPattern()),
        ], child: ServiceLocator(child));
      },
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
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
      //localeListResolutionCallback: _localeListResolutionCallback,
      home: new AppPage(),
    );
  }

}

class AppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AppPageState();
  }
}

class AppPageState extends State<AppPage>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(""),
        ),
        body: new Center(
          child: new ListView(
            children: <Widget>[
              CustomRaisedButton(new UtilsHomePage(title: 'Flutter常用工具库'), "Flutter常用工具库"),
              CustomRaisedButton(new ToolHomePage(title: 'Flutter组件工具库'), "Flutter组件工具库"),
              CustomRaisedButton(new AndroidMain(), "Flutter案例玩Android"),
            ],
          ),
        ),
      ),
    );
  }

}






