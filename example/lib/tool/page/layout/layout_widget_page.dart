


import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/tool/page/layout/position_page.dart';
import 'package:yc_flutter_utils_example/tool/page/layout/row_page.dart';
import 'package:yc_flutter_utils_example/tool/page/layout/stack_layout_page.dart';
import 'package:yc_flutter_utils_example/tool/page/layout/status_page.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';

import 'align_layout_page.dart';
import 'center_page.dart';
import 'colunm_page.dart';
import 'flex_page.dart';
import 'flow_warp_page.dart';


class LayoutWidgetPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new LayoutWidgetState();
  }

}

class LayoutWidgetState extends State<LayoutWidgetPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("布局组件"),
      ),
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRaisedButton(new RowPage(), "Row 水平布局"),
            CustomRaisedButton(new ColunmLayoutPage(), "Column 垂直布局"),
            CustomRaisedButton(new FlexLayoutPage(), "Flex 伸缩布局"),
            CustomRaisedButton(new FlowWrapPage(), "流式布局-Flow-Wrap"),
            CustomRaisedButton(new AlignLayoutPage(), "对齐与相对定位-Align"),
            CustomRaisedButton(new StackLayoutPage(), "对齐与相对定位-Stack"),
            CustomRaisedButton(new PositionPage(), "对齐与相对定位-Position"),
            CustomRaisedButton(new CenterLayoutPage(), "对齐与相对定位-Center"),
            CustomRaisedButton(new StatusLayoutPage(), "自定义错误布局"),
          ],
        ),
      ),
    );
  }



}