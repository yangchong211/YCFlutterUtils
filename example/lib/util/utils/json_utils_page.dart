import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/json/json_utils.dart';
import 'package:yc_flutter_utils_example/util/model/city.dart';


class JsonUtilsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new JsonUtilsState();
  }

}

class JsonUtilsState extends State<JsonUtilsPage>{

  String title1 = "初始化值";
  String title2 = "初始化值";
  String title3 = "初始化值";
  String title4 = "初始化值";
  String title5 = "初始化值";
  String title6 = "初始化值";
  City city = new City("北京");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String listStr = "[{\"name\":\"成都市\"}, {\"name\":\"北京市\"}]";
    String jsonTxt = '{ "name": "yangchong", "email": "yangchong211@163.com"}';
    List<City> cityList = JsonUtils.getObjList(listStr, (v) => City.fromJson(v));


    return new Scaffold(
      //https://www.jianshu.com/p/82842d07e8fe
        appBar: new AppBar(title: new Text("测试JsonUtils的功能")),
        body: ListView(
          children: <Widget>[
            new Text(title1),
            new Text("将对象[值]转换为JSON字符串：" + JsonUtils.encodeObject(city)),
            RaisedButton(
              onPressed: () {
                String objStr = "{\"name\":\"成都市\"}";
                City hisCity = JsonUtils.getObject(objStr, (v) => City.fromJson(v));
                setState(() {
                  title1 = "City对象："+hisCity.name;
                });
              },
              color: const Color(0xffff0000),
              child: new Text('转换JSON字符串[源]到对象'),
            ),
            new Divider(),
            new Text(title2),
            RaisedButton(
              onPressed: () {
                setState(() {
                  title1 = "City对象列表："+cityList.length.toString();
                });
              },
              color: const Color(0xffff0000),
              child: new Text('转换JSON字符串列表[源]到对象列表'),
            ),
            new Divider(),
            new Text(title3),
            RaisedButton(
              onPressed: () {
                Map<String, dynamic> user = JsonUtils.getString(jsonTxt, (v) => {});
                setState(() {
                  title3 = "City对象列表：${user["name"]}";
                });
              },
              color: const Color(0xffff0000),
              child: new Text('转换JSON字符串转化为map'),
            ),
            new Divider(),
            new Text(title4),
            new Text("将对象[值]转换为JSON字符串：" + JsonUtils.encodeObject(city)),
            RaisedButton(
              onPressed: () {
                Map<String,dynamic> map = new Map();
                map["name"] = "yangchong";
                map["age"] = 27;
                map["email"] = "yangchong211@163.com";
                var encodeObject = JsonUtils.encodeObject(map);
                setState(() {
                  title4 = "json字符串：$encodeObject";
                });
              },
              color: const Color(0xffff0000),
              child: new Text('将map对象转化为json字符串'),
            ),
            new Divider(),
            new Text("将对象[值]转换为JSON字符串：" + cityList.length.toString()),
            RaisedButton(
              onPressed: () {
                String objStr = "{\"name\":\"成都市\"}";
                JsonUtils.printJson(objStr);
              },
              color: const Color(0xffff0000),
              child: new Text('单纯的Json格式输出打印'),
            ),
            RaisedButton(
              onPressed: () {
                String objStr = "{\"name\":\"成都市\"}";
                JsonUtils.printJsonEncode(objStr);
              },
              color: const Color(0xffff0000),
              child: new Text('单纯的Json格式输出打印'),
            ),
          ],
        ));
  }

}



