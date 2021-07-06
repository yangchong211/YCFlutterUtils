import 'package:flutter/material.dart';
import 'package:yc_flutter_plugin/locator/get_it.dart';
import 'package:yc_flutter_plugin/locator/get_it_helper.dart';
import 'package:yc_flutter_plugin/log/log_utils.dart';



class GetItPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new GetItState();
  }

}

class GetItState extends State<GetItPage>{

  String title = "初始化值";
  GetItLocator getItLocator;

  @override
  void initState() {
    super.initState();
    if(getItLocator==null){
      getItLocator = new GetItLocator();
      getItLocator.register();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if(getItLocator!=null){
      getItLocator.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("测试getIt的功能")),
        body: ListView(
          children: <Widget>[
            new Text("测试GetItHelper的功能，ServiceLocator，将类与依赖解耦，让类在编译的时候并知道依赖相的具体实现。从而提升其隔离性"),
            new Text(title),
            RaisedButton(
              onPressed: () {
                var businessService = getItLocator.get();
                var noneBusinessPattern = businessService.noneBusinessPattern();
                setState(() {
                  title = noneBusinessPattern+ "---使用GetItHelper";
                });
              },
              color: const Color(0xffff0000),
              child: new Text('使用GetItHelper，获取接口的子类数据'),
            ),
            RaisedButton(
              onPressed: () {
                var businessService = getItLocator.get();
                var noneBusinessPattern = businessService.noneBusinessPattern();
                setState(() {
                  title = noneBusinessPattern + "---使用GetIt";
                });
              },
              color: const Color(0xffff0000),
              child: new Text('使用GetIt，获取接口的子类数据'),
            ),
          ],
        ));
  }

}

class GetItLocator{

  //简单案例，方便分析代码原理
  GetItHelper getIt = new GetItHelper();
  GetIt serviceLocator = GetIt.instance;

  void register(){
    //注册模式状态管理service
    getIt.registerSingleton<BusinessService>(new BusinessServiceImpl());
    serviceLocator.registerLazySingleton<BusinessService>(() => BusinessServiceImpl());
  }

  void reset(){
    getIt.reset();
    //解绑操作
    serviceLocator.resetLazySingleton<BusinessService>();
  }

  BusinessService get(){
    var businessService = getIt<BusinessService>();
    return businessService;
  }

  BusinessService getService(){
    var businessService = serviceLocator<BusinessService>();
    return businessService;
  }

}

abstract class BusinessService {
  //无业务模式
  String noneBusinessPattern();
}


class BusinessServiceImpl extends BusinessService {
  BusinessServiceImpl();
  @override
  String noneBusinessPattern() {
    LogUtils.d("-----noneBusinessPattern");
    return "获取子类的数据";
  }
}