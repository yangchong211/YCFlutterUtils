
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/res/flutter_colors.dart';
import 'package:yc_flutter_utils_example/android/utils/CommonUtils.dart';

class GankAboutPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new GankAboutPageState();
  }
}

class GankAboutPageState extends State<GankAboutPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(CommonUtils.getLocale(context).about),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.account_balance),
              onPressed: () {

              }),
        ],
      ),
      body: new Container(
        child: new Padding(
          padding: const EdgeInsets.all(14.0),
          child: new Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(CommonUtils.getLocale(context).introduction,
                  style: Theme.of(context).textTheme.title),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: new Divider(height: 1.0,color: FlutterColors.color_1AA357D6,),
              ),
              new Text(CommonUtils.getLocale(context).gankDesc,
                  style: Theme.of(context).textTheme.body1),
              new Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: new Row(
                  children: <Widget>[
                    new Text(CommonUtils.getLocale(context).sourceCode),
                    new RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                              text: "yangchong/ycflutter",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                })
                        ])
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: new Row(
                  children: <Widget>[
                    new Text("我的GitHub"),
                    new RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                              text: "yangchong/ycflutter",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                })
                        ])
                    ),
                  ],
                ),
              ),
              new Padding(padding: const EdgeInsets.only(top: 20)),
              new Text(CommonUtils.getLocale(context).developer,
                  style: Theme.of(context).textTheme.title),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: new Divider(height: 1,color: FlutterColors.color_1AA357D6,),
              ),
              Text("yangchong", style: Theme.of(context).textTheme.body1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Icon(Icons.account_balance),
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                              text: "https://github.com/yangchong211",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {

                                })
                        ]))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(CommonUtils.getLocale(context).join,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Colors.cyan)),
              ),
            ],
          ),
        ),
      )
    );
  }



}