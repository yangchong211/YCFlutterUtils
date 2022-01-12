
import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/widget/xpanel_widget.dart';

class CustomXPanelPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new XPanelState();
  }

}

class XPanelState extends State<CustomXPanelPage>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('自定义简单的xpanel控件'),
        ),
        body: Container(
          child: Stack(
            children: [
              Center(
                child: Text('这个是一个文本控件'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: XPanelWidget(
                  initHeight: 150,
                  totalHeight: 320,
                  headWidget: Container(
                    height: 150,
                    color: Colors.red,
                    child: Text("这个是可视区域"),
                  ),
                  contentWidget: Container(
                    height: 150,
                    color: Colors.yellow,
                    child: Text("这个是底部区域"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}