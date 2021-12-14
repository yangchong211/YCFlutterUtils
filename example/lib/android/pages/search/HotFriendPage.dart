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
import 'package:yc_flutter_utils/net/http_api_utils.dart';
import 'package:yc_flutter_utils_example/android/api/AndroidApi.dart';
import 'package:yc_flutter_utils_example/android/pages/detail/ArticleDetailPage.dart';
import 'package:yc_flutter_utils_example/android/pages/search/SearchPage.dart';
import 'package:yc_flutter_utils_example/android/res/YcColors.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/11/18
 *     desc  : 热门搜索页面
 *     revise:
 * </pre>
 */
class HotFriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HotPageState();
  }
}

class HotPageState extends State<HotFriendPage> {
  
  List<Widget> hotWidgets = new List();
  List<Widget> friendWidgets = new List();

  @override
  void initState() {
    super.initState();
    //获取常用网站
    getFriendNet();
    //获取热门关键字
    getHotKeywords();
  }

  @override
  Widget build(BuildContext context) {
    if((hotWidgets == null || hotWidgets.length == 0) &&
        (friendWidgets == null || friendWidgets.length == 0)){
      //展示progress
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      return new ListView(
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.all(10.0),
              child: new Text('大家都在搜',
                  style: new TextStyle(color: YcColors.colorPrimary, fontSize: 16.0))),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: hotWidgets,
            ),
          ),
          new Padding(
              padding: EdgeInsets.all(10.0),
              child: new Text('常用网站',
                  style: new TextStyle(color: YcColors.colorPrimary, fontSize: 16.0))),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: friendWidgets,
            ),
          ),
        ],
      );
    }
  }

  //获取常用网站
  void getFriendNet() {
    HttpApiUtils.get(AndroidApi.FRIEND, (data) {
      setState(() {
        List datas = data;
        friendWidgets.clear();
        for (var itemData in datas) {
          Widget actionChip = new ActionChip(
              backgroundColor: YcColors.colorPrimary,
              padding: EdgeInsets.all(1.0),
              label: new Text(
                itemData['name'],
                style: new TextStyle(color: YcColors.colorWhite , fontSize: 12),
              ),
              onPressed: () {
                itemData['title'] = itemData['name'];
                Navigator
                    .of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new ArticleDetailPage(
                      title: itemData['title'], url: itemData['link']);
                }));
              });
          friendWidgets.add(actionChip);
        }
      });
    });
  }

  //获取热门关键字
  void getHotKeywords() {
    HttpApiUtils.get(AndroidApi.HOT, (data) {
      setState(() {
        List dataHot = data;
        hotWidgets.clear();
        for (var value in dataHot) {
          Widget actionChip = new ActionChip(
              backgroundColor: YcColors.colorPrimary,
              padding: EdgeInsets.all(1.0),
              label: new Text(
                value['name'],
                style: new TextStyle(color: YcColors.colorWhite , fontSize: 12),
              ),
              onPressed: () {
                Navigator
                    .of(context)
                    .pushReplacement(new MaterialPageRoute(builder: (context) {
                  return new SearchPage(value['name']);
                }));
              });
          hotWidgets.add(actionChip);
        }
      });
    });
  }
}
