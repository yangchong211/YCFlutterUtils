import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/tool/page/simple/layout_page.dart';
import 'package:yc_flutter_utils_example/tool/page/simple/sliverWidget/sliver_page.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';



void main() {
  runApp(new MaterialApp(home: new SimpleWidgetMainPage()));
}

class SimpleWidgetMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("基础组件"),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            CustomRaisedButton(new LayoutPage(), "layout布局"),
            CustomRaisedButton(new SliverPage(), "Sliver Widget"),
          ],
        ),
      ),
    );
  }
}
