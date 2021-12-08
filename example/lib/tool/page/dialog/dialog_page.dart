

import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new DialogState();
  }

}

class DialogState extends State<DialogPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("弹窗和吐司"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        ],
      ),
    );
  }
}