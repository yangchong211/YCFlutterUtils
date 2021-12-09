

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
    return Container(
      color: Colors.brown,
      height: double.infinity,
      child: Container(
        height: 100,
        width: 100,
        child: Text("学习"),
        color: Colors.amberAccent,
      ),
    );
  }
}