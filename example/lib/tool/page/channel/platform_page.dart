import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';

import 'android_platform_page.dart';
import 'calc_plugin_page.dart';


class PlatformPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("平台交互"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomRaisedButton(AndroidPlatformPage(), "直接调用平台代码"),
          CustomRaisedButton(CalcPluginPage(), "利用插件调用平台代码，待完善"),
        ],
      ),
    );
  }
}
