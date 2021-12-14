

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yc_flutter_utils/bus/event_bus_helper.dart';
import 'package:yc_flutter_utils/res/flutter_colors.dart';
import 'package:yc_flutter_utils/router/navigator_utils.dart';
import 'package:yc_flutter_utils_example/android/local/gank_localizations_delegate.dart';
import 'package:yc_flutter_utils_example/android/pages/gank/component/welfare_page.dart';
import 'package:yc_flutter_utils_example/android/utils/Constants.dart';
import 'package:yc_flutter_utils_example/android/weight/widget_bottom_tabs.dart';

import 'gank_about_page.dart';


class GankMain extends StatefulWidget{

  static const String ROUTER_NAME = 'home';

  @override
  State<StatefulWidget> createState() {
    return new GankState();
  }
}

class GankState extends State<GankMain> {

  int _currentPageIndex;
  String _currentDate;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //navigatorKey: navigatorKey,
      //设置主题
      theme: ThemeData(
          accentColor: Colors.black,
          textSelectionColor: FlutterColors.color_1AA357D6,
          primaryColor: FlutterColors.color_FF6A60),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GankLocalizationsDelegate.delegate,
      ],
      //设置home
      home: new Scaffold(
        appBar: _buildAppBar(),
        drawer: GankDrawer(),
        body: _buildBody(),
        bottomNavigationBar: BottomTabs(_pageController, _pageChange),
      ),
    );
  }

  ///build AppBar.
  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Offstage(
        offstage: _currentPageIndex != 0,

        ///标题栏显示当前日期
        child: Text(_currentDate ?? ''),
      ),
      actions: <Widget>[_buildActions()],
    );
  }

  ///创建标题栏右侧按钮
  IconButton _buildActions() {
    return new IconButton(
      icon: getActionsIcon(),
      onPressed: () async {
        if (_currentPageIndex == 0) {
          ///显示/隐藏日期
        } else if (_currentPageIndex == 1) {
          ///去搜索页
        } else if (_currentPageIndex == 2) {
          ///切换妹纸图列数按钮
          bus.emit(Constants.updateGirl);
        } else {
        }
      },
    );
  }

  ///获取标题栏右侧图标.
  Icon getActionsIcon() {
    if (_currentPageIndex == 0) {
      return new Icon(Icons.alarm);
    } else if (_currentPageIndex == 1) {
      return new Icon(Icons.brightness_auto);
    } else if (_currentPageIndex == 2) {
      return new Icon(Icons.toys);
    } else {
      return new Icon(Icons.toys);
    }
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: _pageChange,
          controller: _pageController,
          children: <Widget>[
            GankAboutPage(),
            GankAboutPage(),
            WelfarePage(),
            WelfarePage()
          ],
        ),
      ],
    );
  }

  ///页面切换回调
  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

}


class GankDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GankDrawerState();
  }
}

class _GankDrawerState extends State<GankDrawer>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizableDrawer(
      widthPercent: 0.6,
      child: Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("杨充"),
            accountEmail: Text("yangchong211@163.com"),
            onDetailsPressed: (){

            },
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: new ExactAssetImage("lib/image/ic_person.jpg"),
              ),
              onTap: (){

              },
            ),
          ),
          new ListTile(
              title: new Text("我的收藏"),
              trailing: new Icon(Icons.email),
              onTap: (){

              }
          ),
          new Divider(),
          new ListTile(
              title: new Text("GitHub客户端"),
              trailing: new Icon(Icons.email),
              onTap: (){

              }
          ),
          new Divider(),
          new ListTile(
              title: new Text("消息中心"),
              trailing: new Icon(Icons.verified_user),
              onTap: (){

              }
          ),
          new Divider(),
          new ListTile(
              title: new Text("提交项目"),
              trailing: new Icon(Icons.present_to_all),
              onTap: (){
              }
          ),
          new Divider(),
          new ListTile(
              title: new Text("妹子图"),
              trailing: new Icon(Icons.group_work),
              onTap: (){
                _gotoActivity(context, WelfarePage());
              }
          ),
          new Divider(),
          new ListTile(
            title: new Text("关于项目"),
            trailing: new Icon(Icons.apps),
            onTap: (){
              _gotoActivity(context, GankAboutPage());
            },
          ),
          new Divider(),
          new ListTile(
              title: new Text("设置中心"),
              trailing: new Icon(Icons.settings),
              onTap: (){
                _gotoActivity(context, WelfarePage());
              }
          ),
          new Divider(),
        ],
      ),
    );
  }

  ///跳转到某个具体的页面
  void _gotoActivity(BuildContext context, Widget activity) {
    Navigator.of(context).pop();
    NavigatorUtils.push(context, activity);
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//      return activity;
//    }));
  }

}




class SizableDrawer extends StatelessWidget {
  const SizableDrawer(
      {Key key,
        this.elevation = 16.0,
        this.child,
        this.semanticLabel,
        this.widthPercent = 0.7}): assert(elevation != null && elevation >= 0.0),
        assert(widthPercent != null && widthPercent < 1.0 && widthPercent > 0.0),
        super(key: key);

  final double elevation;
  ///宽度百分比
  final double widthPercent;
  ///自widget
  final Widget child;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    String label = semanticLabel;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        label = semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = semanticLabel ?? MaterialLocalizations.of(context)?.drawerLabel;
    }

    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
            width: MediaQuery.of(context).size.width * widthPercent),
        child: Material(
          elevation: elevation,
          child: child,
        ),
      ),
    );
  }
}
