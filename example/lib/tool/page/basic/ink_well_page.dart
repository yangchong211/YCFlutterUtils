import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/file/file_utils.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';
import 'package:yc_flutter_utils_example/res/image/images.dart';


class InkWellPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new InkWellState();
  }
}


class InkWellState extends State<InkWellPage> {

  Color textColor = Colors.red;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("InkWell")),
        body: Container(
          color: Colors.red,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //需要添加 Scaffold ，否则报错
              InkWell(
                child: Container(
                  child: Text(
                    "宝盛里",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize:18,
                    ),
                  ),
                ),
                onTap: (){
                  LogUtils.i("InkWell : 点击事件");
                },
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                child: Text(
                  "奥林匹克公园",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onLongPress: (){
                  LogUtils.i("InkWell : 点击事件");
                },
              ),
            ],
          ),
        )
    );
  }
}
