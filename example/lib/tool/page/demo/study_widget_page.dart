

import 'package:flutter/material.dart';

class StudyWidgetPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new StudyWidgetState();
  }

}

class StudyWidgetState extends State<StudyWidgetPage>{
  @override
  Widget build(BuildContext context) {
    AppBarTheme appBarTheme = Theme.of(context).appBarTheme;

    return Container(
      color: Colors.brown,
      height: double.infinity,
      child: Row(
        children: [
          new Image.network(
            "https://p1.ssl.qhmsg.com/dr/220__/t01d5ccfbf9d4500c75.jpg",
            width: 100,
            height: 100,
          ),
          new Text(
              "改变UI",
            style: TextStyle(
              fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}