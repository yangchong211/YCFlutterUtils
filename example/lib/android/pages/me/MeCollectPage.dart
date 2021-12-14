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
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/net/http_api_utils.dart';
import 'package:yc_flutter_utils/sp/sp_utils.dart';
import 'package:yc_flutter_utils_example/android/api/AndroidApi.dart';
import 'package:yc_flutter_utils_example/android/pages/detail/ArticleDetailPage.dart';
import 'package:yc_flutter_utils_example/android/utils/Constants.dart';
import 'package:yc_flutter_utils_example/android/weight/EndLine.dart';

import 'LoginPage.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/12/07
 *     desc  : 收藏文章界面
 *     revise:
 * </pre>
 */
class CollectPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我收藏的文章'),
      ),
      body: new MeCollectPage(),
    );
  }

}


class MeCollectPage extends StatefulWidget {
  MeCollectPage();
  @override
  State<StatefulWidget> createState() {
    return new MeCollectPageState();
  }
}

class MeCollectPageState extends State<MeCollectPage> {

  int curPage = 0;
  Map<String, String> map = new Map();
  List listData = new List();
  int listTotalSize = 0;
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    if (listData == null || listData.isEmpty) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = new ListView.builder(
        physics: new AlwaysScrollableScrollPhysics(),
        itemCount: listData.length,
        itemBuilder: (context, i) => buildItem(i),
        controller: scrollController,
      );
      return new RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  @override
  void initState() {
    super.initState();
    getCollectList();
    addListener();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  //获取收藏接口的数据
  //更多可以看：https://github.com/yangchong211/YCBlogs
  void getCollectList() {
    String url = AndroidApi.COLLECT_LIST;
    url += "$curPage/json";
    HttpApiUtils.get(url, (data) {
      if (data != null) {
        Map<String, dynamic> map = data;
        var datas = map['datas'];
        listTotalSize = map["total"];
        setState(() {
          List list1 = new List();
          if (curPage == 0) {
            listData.clear();
          }
          curPage++;
          list1.addAll(listData);
          list1.addAll(datas);
          if (list1.length >= listTotalSize) {
            list1.add(Constants.complete);
          }
          listData = list1;
        });
      }
    }, params: map);
  }

  Future<Null> _pullToRefresh() async {
    curPage = 0;
    getCollectList();
    return null;
  }

  Widget buildItem(int i) {
    var itemData = listData[i];
    if (i == listData.length - 1 &&
        itemData.toString() == Constants.complete) {
      return new EndLine();
    }

    Row row1 = new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Expanded(
            child: new Row(
          children: <Widget>[
            new Text('作者:  '),
            new Text(
              itemData['author'],
              style: new TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        )),
        new Text(itemData['niceDate'])
      ],
    );

    Row title = new Row(
      children: <Widget>[
        new Expanded(
          child: new Text(
            itemData['title'],
            softWrap: true,
            style: new TextStyle(fontSize: 16.0, color: Colors.black),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );

    Row collect = new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new GestureDetector(
          child: new Icon(
            Icons.favorite, color: Colors.red,
          ),
          onTap: () {
            onItemCollect(itemData);
          },
        )
      ],
    );

    Column column = new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: row1,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: title,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          child: collect,
        ),
      ],
    );

    return new Card(
      elevation: 4.0,
      child: new InkWell(
        onTap: () {
          itemClick(itemData);
        },
        child: column,
      ),
    );
  }

  void onItemCollect(itemData) {
    var isLogin = SpUtils.getBool("isLogin");
    if (!isLogin) {
      // 开始登陆
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
        return new LoginPage();
      }));
    } else {
      unCollect(itemData);
    }
  }


  void itemClick(var itemData) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new ArticleDetailPage(
          title: itemData['title'], url: itemData['link']);
    }));
  }


  //取消收藏
  void unCollect(var itemData) {
    String url = AndroidApi.UN_COLLECT_LIST;
    Map<String, String> map = new Map();
    map['originId'] = itemData['originId'].toString();
    url = url + itemData['id'].toString() + "/json";
    HttpApiUtils.post(url, (data) {
      setState(() {
        listData.remove(itemData);
      });
    }, params: map);
  }

  void addListener() {
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var pixels = scrollController.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        getCollectList();
      }
    });
  }
}
