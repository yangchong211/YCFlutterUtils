

import 'dart:async';

import 'package:yc_flutter_utils/bus/event_bus_service.dart';
import 'package:yc_flutter_utils_example/android/data/cons/event_bus_name.dart';



class SelectDialogViewModel{

  List<SelectNav> listTitle = new List<SelectNav>();
  StreamSubscription _subscription;
  Function _callBackRefreshState;

  SelectDialogViewModel() {
    //添加前后台监听
    _registerAppSwitchBackground();
  }

  /// 添加数据
  Future<void> addSelectData() async {
    listTitle.clear();
    listTitle.add(new SelectNav("查看大图片",1));
    listTitle.add(new SelectNav("保存图片到本地相册",2));
    listTitle.add(new SelectNav("分享图片到微信好友",3));
  }

  /// 针对已经安装的，同步状态给NA
  void setNavType(int radioValue) {

  }

  /// 跳转应用市场详情页
  void toNavAppDetail(int radioValue) {

  }

  /// 设置切换前台刷新监听
  void setCallBackRefresh(Function callBack) {
    _callBackRefreshState = callBack;
  }

  /// 监听app退至后台
  void _registerAppSwitchBackground() {
    if (null != _subscription) {
      _unregisterAppSwitchBackground();
    }
    _subscription = EventBusService.instance.eventBus.on<EventMessage>().listen((event) {
      String name = event.eventName;
      //前后台切换发生了变化
      if (name == EventBusName.EVENT_BACKGROUND_CHANGE) {
        bool appBackground = event.arguments["appBackground"];
        if (!appBackground) {
          _callBackRefreshState();
        }
      }
    });
  }

  /// 取消监听app退至后台
  void _unregisterAppSwitchBackground() {
    if (_subscription != null) {
      _subscription.cancel();
      _subscription = null;
    }
  }

  void dispose() {
    _unregisterAppSwitchBackground();
  }

}

class SelectNav{
  ///文案名称
  String name;
  ///类型
  int type;

  SelectNav(String navName , int navType){
    name = navName;
    type = navType;
  }
}