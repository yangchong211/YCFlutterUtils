import 'package:flutter/material.dart';
import 'package:yc_flutter_plugin/toast/yc_toast.dart';



class ToastTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ToastTestState();
  }

}

class ToastTestState extends State<ToastTest>{

  @override
  initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('小杨逗比吐司工具库'),
        ),
        body: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("1.吐司工具，最简单的吐司"),
              onTap: (){
                YcToast.showToast(
                  title: "逗比吐司",
                );
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("2.吐司工具，设置位置在中间"),
              onTap: (){
                YcToast.showToast(
                    title: "逗比吐司",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER);
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("3.吐司工具，设置字体大小"),
              onTap: (){
                YcToast.showToast(
                    title: "逗比",
                    fontSize: 14,);
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("4.吐司工具，设置吐司圆角"),
              onTap: (){
                YcToast.showToast(
                    title: "逗比",
                    radius:25,
                    gravity: ToastGravity.CENTER);
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("5.吐司工具，吐司标题和内容"),
              onTap: (){
                YcToast.showToast(
                    title: "逗比",
                    desc: "这个是内容",
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 14,
                    radius:20,
                    gravity: ToastGravity.CENTER);
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("6.吐司工具，设置系统吐司"),
              onTap: (){
                YcToast.showToast(
                    title: "逗比",
                    type: Type.SYSTEM,
                    toastLength: Toast.LENGTH_SHORT);
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("7.自定义吐司，设置背景和颜色"),
              onTap: (){
                YcToast.showToast(
                    title: "逗比",
                    desc: "这个是内容",
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 14,
                    radius:20,
                    bgColor: Color(0xFFB71C1C),
                    textColor: Color(0xFF4A148C),
                    gravity: ToastGravity.CENTER,);
              },
            ),
            new Divider(),
          ],
        ),
      ),
    );
  }



}

