/*
Copyright 2017 yangchong211（github.com/yangchong211）

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/


import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/android/pages/gank/component/gank_main.dart';
import 'package:yc_flutter_utils_example/android/pages/main/android_main.dart';
import 'package:yc_flutter_utils_example/android/res/YcColors.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2019/3/22
 *     desc  : 启动页
 *     revise: 博客：https://www.jianshu.com/p/c80fca757bb2
 * </pre>
 */
class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }

}

class SplashPageState extends State<Splash> {

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      navigatorKey: navigatorKey,
      //设置主题
      theme: ThemeData(
          accentColor: Colors.black,
          textSelectionColor: YcColors.colorWhite,
          primaryColor: YcColors.colorWhite),
      home : new Scaffold(
        body: new ListView(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          children: <Widget>[
            new ListTile(
                title: const Text('打开玩Android客户端'),
                onTap: () {
                  /*Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                    return new AndroidMain();
                  }));*/
                  navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                    return new AndroidMain();
                  }));
                }),
            new ListTile(
                title: const Text('打开干货集中营客户端'),
                onTap: () {
                  /*Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                    return new GankMain();
                  }));*/
                  navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                    return new GankMain();
                  }));
                }),
          ],
        ),
      )
    );
  }

}
