

import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/tool/page/demo/study_widget_page.dart';
import 'package:yc_flutter_utils_example/util/widget/custom_raised_button.dart';

class DemoWidgetPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new DemoWidgetState();
  }

}

class DemoWidgetState extends State<DemoWidgetPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("认识widget"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomRaisedButton(new StudyWidgetPage(), "认识widget"),

        ],
      ),
    );
  }
}