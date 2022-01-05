


import 'package:flutter/material.dart';

import 'package:yc_flutter_utils/log/log_utils.dart';
import 'package:yc_flutter_utils_example/tool/page/basic/ink_well_page.dart';
import 'package:yc_flutter_utils_example/tool/page/basic/switch_page.dart';
import 'package:yc_flutter_utils_example/tool/page/basic/text_field_page.dart';
import 'package:yc_flutter_utils_example/tool/page/basic/text_page.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';

import 'basic_skeleton_page.dart';
import 'button_page.dart';
import 'i18_localization_page.dart';
import 'icon_page.dart';
import 'image_page.dart';

class BasicWidgetPage extends StatefulWidget{

  final String title;

  BasicWidgetPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return new BasicWidgetState();
  }

}

class BasicWidgetState extends State<BasicWidgetPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("基础组件 ${widget.title}"),
      ),
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRaisedButton(new TextPage(), "Text组件"),
            CustomRaisedButton(new TextFieldPage(), "TextField组件"),
            CustomRaisedButton(new ImagePage(), "Image组件"),
            CustomRaisedButton(new IconPage(), "Icon组件"),
            CustomRaisedButton(new ButtonPage(), "Button控件"),
            CustomRaisedButton(new SwitchPage(), "单选开关和复选框控件"),
            CustomRaisedButton(new InkWellPage(), "InkWell控件"),
            CustomRaisedButton(new IndicatorProgressPage(), "进度指示器"),
            CustomRaisedButton(new LocalizationsPage(), "国际化"),
          ],
        ),
      ),
    );
  }

}