import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/android/local/gank_localizations.dart';
import 'package:yc_flutter_utils_example/android/utils/CommonUtils.dart';

class BottomTabs extends StatefulWidget {

  final PageController pageController;
  final ValueChanged<int> onTap;

  BottomTabs(this.pageController, this.onTap);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var _bottomTabs = <BottomNavigationBarItem>[
      ///最新
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(CommonUtils.getLocale(context).gankNew),
      ),

      ///分类
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment),
        title: Text(GankLocalizations.of(context).currentLocalized.gankCategory),
      ),

      ///妹纸
      BottomNavigationBarItem(
        icon: Icon(Icons.devices_other),
        title: Text(CommonUtils.getLocale(context).girl),
      ),

      ///文章
      BottomNavigationBarItem(
        icon: Icon(Icons.supervised_user_circle),
        title:Text(GankLocalizations.of(context).currentLocalized.article),
      ),
    ];

    return BottomNavigationBar(
      items: _bottomTabs,
      type: BottomNavigationBarType.fixed,
      iconSize: 32,
      currentIndex: currentIndex,
      onTap: (int index) {
        if (widget.onTap != null) {
          currentIndex = index;
          widget.pageController.jumpToPage(index);
          widget.onTap(index);
        }
      },
    );
  }
}
