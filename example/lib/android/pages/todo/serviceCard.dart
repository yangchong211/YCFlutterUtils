/*
Copyright 2017 yangchong211（github.com/yangchong211）

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/flutter_utils.dart';
import 'package:yc_flutter_utils_example/android/pages/detail/ArticleDetailPage.dart';
import 'package:yc_flutter_utils_example/android/res/YcColors.dart';
import 'package:yc_flutter_utils_example/android/res/YcString.dart';


Widget serviceView(BuildContext context) {

  return new Container(
    color: YcColors.colorWhite,
    margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
    padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
    child: new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {

                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.layers, color: Colors.white),
                              backgroundColor: Colors.green,
                            ),
                          ),
                          new Container(
                            child: new Text(
                              YcString.wanAndroid,
                              style: new TextStyle(
                                  color: YcColors.colorPrimary,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: 'github',
                          url: 'https://github.com/yangchong211/YCBlogs',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.ac_unit, color: Colors.white),
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.github,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '潇湘剑雨',
                          url: 'https://blog.csdn.net/m0_37700275/article/details/79832978',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.tablet_android, color: Colors.white),
                              backgroundColor: new Color(0xFFA68F52),
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.csdn,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '张鸿洋大神',
                          url: 'https://blog.csdn.net/lmj623565791',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.tv, color: Colors.white),
                              backgroundColor: new Color(0xFF088DB4),
                            ),
                          ),
                          new Container(
                            child: new Text(
                              YcString.zhy,
                              style: new TextStyle(
                                  color: YcColors.colorPrimary,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '网络爬虫',
                          url: 'https://github.com/yangchong211/YCMeiZiTu',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.radio, color: Colors.white),
                              backgroundColor: Colors.cyan,
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.push,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '喜马拉雅',
                          url: 'https://www.ximalaya.com/zhubo/71989305/',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.wifi_tethering,
                                  color: Colors.white),
                              backgroundColor: Colors.brown,
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.resource,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '郭霖大神',
                          url: 'https://blog.csdn.net/guolin_blog/',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.text_format,
                                  color: Colors.white),
                              backgroundColor: new Color(0xFF355A9B),
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.app,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '我的视频封装库',
                          url: 'https://github.com/yangchong211/YCVideoPlayer',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.local_movies,
                                  color: Colors.white),
                              backgroundColor: Colors.orange,
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.video,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '妹子福利',
                          url: 'https://github.com/yangchong211/YCMeiZiTu',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child:
                                  new Icon(Icons.favorite, color: Colors.white),
                              backgroundColor: Colors.red,
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.welfare,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '图片画廊',
                          url: 'https://github.com/yangchong211/YCGallery',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.perm_data_setting,
                                  color: Colors.white),
                              backgroundColor: new Color(0xFF636269),
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.aboutTitle,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary, fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '版本更新库',
                          url: 'https://github.com/yangchong211/YCUpdateApp',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.update, color: Colors.white),
                              backgroundColor: new Color(0xFFB86A0D),
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.updateTitle,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary, fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new ArticleDetailPage(
                          title: '版本更新库',
                          url: 'https://github.com/yangchong211/YCUpdateApp',
                        );
                      }));
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.edit, color: Colors.white),
                              backgroundColor: new Color(0xFF63616D),
                            ),
                          ),
                          new Container(
                            child: new Text(YcString.thinkTitle,
                                style: new TextStyle(
                                    color: YcColors.colorPrimary, fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
