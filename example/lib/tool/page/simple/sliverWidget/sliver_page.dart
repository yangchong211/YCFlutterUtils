import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/tool/page/simple/sliverWidget/sliver_appbar_page.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';


class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("基础组件"),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            CustomRaisedButton(new SliverAppBarPage(), "SliverAppBarPage"),
          ],
        ),
      ),
    );
    ;
  }
}
