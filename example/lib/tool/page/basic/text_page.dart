import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yc_flutter_utils/calcu/calculate_utils.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';
import 'package:yc_flutter_utils/res/flutter_colors.dart';

class TextPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TextPageState();
  }
}

class TextPageState extends State<TextPage>{
  Model _model;

  @override
  void initState() {
    _model = Model();
    LogUtils.i("initState"+_model.toString());
    LogUtils.i("initState ${_model.toString()}");
    LogUtils.i("_model initState haha");
    super.initState();
  }

  @override
  void dispose() {
    _model = null;
    LogUtils.i("_model dispose");
    super.dispose();
  }

  Future getNetworkData(){
    return Future(() {
      //1. 将耗时操作包裹到Future的回调函数中
      //1.1 只要有返回结果，那么就执行Future对应的then的回调；
      //1.2 如果没有结果返回（或请求错误），需要在Future回调中抛出一个异常；
      sleep(Duration(seconds: 3));
      // throw Exception("网络请求错误");
      return "网络请求结果";
    });
  }


  @toDo("这个定义的变量", "注意初始化")
  String text1 = "初始化值";

  @override
  Widget build(BuildContext context) {
    var textWidth = CalculateUtils.calculateTextLocaleWidth(
        context,"这个是一个文本控件", 18.0, null, 300, 1);

    String s = "123456789";
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hello Flutter"),
        ),
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                //内容
                "这个是文本内容",
                //最大3行
                maxLines: 3,
                //对齐方式
                textAlign: TextAlign.end,
                //文本方向
                textDirection: TextDirection.ltr,
                //是否允许换行显示
                softWrap: true,
                //超出屏幕显示方式
                overflow: TextOverflow.ellipsis,
                //样式
                style: new TextStyle(

                ),
              ),
              new Text.rich(
                  new TextSpan(
                    //内容
                    text: "这个文本",
                    //样式
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: FlutterColors.color_FF0000,
                      wordSpacing: 3,
                    ),
                  ),
              ),
              Container(
                color: FlutterColors.color_2EBFD9,
                child: new Text(
                  "这个是一个文本控件",
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: FlutterColors.color_FF0000,
                  ),
                  maxLines: 1,
                  textDirection: TextDirection.rtl,
                ),
              ),
              Padding(padding: EdgeInsetsDirectional.only(top: 10)),
              Container(
                width: textWidth,
                color: FlutterColors.color_2EBFD9,
                child: new Text(
                  "这个是一个文本控件",
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: FlutterColors.color_FF0000,
                  ),
                  maxLines: 1,
                  textDirection: TextDirection.rtl,
                ),
              ),
              Padding(padding: EdgeInsetsDirectional.only(top: 10)),
              new Text(
                'inherit: 为 false 的时候不显示',
                style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.redAccent,
                  inherit: true,
                ),
              ),
              new Text(
                'color/fontSize: 字体颜色，字号等',
                style: new TextStyle(
                  color: Color.fromARGB(255, 150, 150, 150),
                  fontSize: 22.0,
                ),
              ),
              new Text(
                'fontWeight: 字重',
                style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w700),
              ),

              new Text(
                'fontStyle: FontStyle.italic 斜体',
                style: new TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              new Text(
                'letterSpacing: 字符间距',
                style: new TextStyle(
                  letterSpacing: 10.0,
                  // wordSpacing: 15.0
                ),
              ),
              new Text(
                'wordSpacing: 字或单词间距',
                style: new TextStyle(
                  // letterSpacing: 10.0,
                    wordSpacing: 15.0
                ),
              ),
              new Text(
                'textBaseline:这一行的值为TextBaseline.alphabetic',
                style: new TextStyle(textBaseline: TextBaseline.alphabetic),
              ),
              new Text(
                'textBaseline:这一行的值为TextBaseline.ideographic',
                style: new TextStyle(textBaseline: TextBaseline.ideographic),
              ),
              new Text('height: 用在Text控件上的时候，会乘以fontSize做为行高,所以这个值不能设置过大',
                  style: new TextStyle(
                    height: 1.0,
                  )),
              new Text('decoration: TextDecoration.overline 上划线',
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.redAccent,
                      decoration: TextDecoration.overline,
                      decorationStyle: TextDecorationStyle.wavy)),
              new Text('decoration: TextDecoration.lineThrough 删除线',
                  style: new TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationStyle: TextDecorationStyle.dashed)),
              new Text('decoration: TextDecoration.underline 下划线',
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.redAccent,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted)),
              new RaisedButton(
                  onPressed: () {
                    getText(context);
                  },
                  child: new Text("获取屏幕的宽高属性")
              ),
              Padding(padding: EdgeInsetsDirectional.only(top: 10)),
              new Text( "这个是文本 : RichText"),
              richTextWid01(),
              richTextWid02(),
              richTextWid03(),
              richTextWid04(),
              richTextWid05(),

              Padding(padding: EdgeInsetsDirectional.only(top: 10)),
              new Text( "这个是文本 : textPainter"),
              //textPainter1(),
            ],
          ),
        ));
  }

  Widget richTextWid01() {
    return RichText(
        text: TextSpan(
            text: 'TextDirection.ltr 文字默认居左',
            style: TextStyle(fontSize: 16.0, color: Colors.black)),
        textDirection: TextDirection.ltr);
  }

  Widget richTextWid02() {
    return RichText(
        text: TextSpan(
            text: 'TextDirection.rtl 文字默认居右',
            style: TextStyle(fontSize: 16.0, color: Colors.black)),
        textDirection: TextDirection.rtl);
  }

  Widget richTextWid03() {
    return new RichText(
        text: new TextSpan(
          text: "优先看整体，文字居中",
          style: new TextStyle(
            fontSize: 16.0,
            color: FlutterColors.color_00
          ),
        ),
        textAlign: TextAlign.center,
    );
    return RichText(
        text: TextSpan(
            text: 'textDirection 与 textAlign 同时设置，优先看整体，文字居中',
            style: TextStyle(fontSize: 16.0, color: Colors.black)),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center);
  }

  Widget richTextWid04() {
    return RichText(
        text: TextSpan(
            text: '多种样式，如：',
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: '红色',
                  style: TextStyle(fontSize: 18.0, color: Colors.red)),
              TextSpan(
                  text: '绿色',
                  style: TextStyle(fontSize: 18.0, color: Colors.green)),
              TextSpan(
                  text: '蓝色',
                  style: TextStyle(fontSize: 18.0, color: Colors.blue)),
              TextSpan(
                  text: '白色',
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
              TextSpan(
                  text: '紫色',
                  style: TextStyle(fontSize: 18.0, color: Colors.purple)),
              TextSpan(
                  text: '黑色',
                  style: TextStyle(fontSize: 18.0, color: Colors.black))
            ]),
        textAlign: TextAlign.center);
  }

  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();
  void tapGesture(){
    tapGestureRecognizer.onTap = (){
      setState(() {
        text1 = "我被点击呢";
      });
    };
  }
  Widget richTextWid05() {
    return RichText(
        text: TextSpan(
            text: 'RichText 可设置点击事件，' + text1,
            style: TextStyle(fontSize: 17.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: '点我试试',
                  style: TextStyle(fontSize: 17.0, color: Colors.blue),
                  recognizer: tapGestureRecognizer)
            ]));
  }

  void getText(BuildContext context){
    LogUtils.d("-getText-"+"------");
    var screenWidth = MediaQuery.of(context).size.height;
    double height = CalculateUtils.calculateTextHeight1(context, "这个是文本",
        FontWeight.w600, FontWeight.w700,  screenWidth, 10);
    double width = CalculateUtils.calculateTextLocaleWidth(context, "这个是文本",
        FontWeight.w600, FontWeight.w700,  screenWidth, 10);
    setState(() {
      text1 = "宽："+width.toString() + " 高："+height.toString();
    });
    LogUtils.d("-getText-"+"宽："+width.toString() + " 高："+height.toString());
  }


}


class Model {
  Future<List<int>> preloadAnimAsset(String path) async {
    if (path == null || path.length == 0) {
      return Future.value(List<int>(0));
    }
    return (await rootBundle.load(path)).buffer.asUint8List();
  }
}

/// 自定义注解
class toDo {
  final String who;
  final String what;
  const toDo(this.who, this.what);
}