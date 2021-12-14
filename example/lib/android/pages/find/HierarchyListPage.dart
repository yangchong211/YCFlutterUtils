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
import 'package:yc_flutter_utils_example/android/api/AndroidApi.dart';
import 'package:yc_flutter_utils_example/android/pages/home/component/article_item.dart';
import 'package:yc_flutter_utils_example/android/utils/Constants.dart';
import 'package:yc_flutter_utils_example/android/weight/EndLine.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/8/22
 *     desc  : 首页面
 *     revise:
 * </pre>
 */
class HierarchyListPage extends StatefulWidget {
  
  String id;
  HierarchyListPage(id){
    this.id = id;
  }

  @override
  State<StatefulWidget> createState() {
    return new HierarchyListPageState();
  }
}

class HierarchyListPageState extends State<HierarchyListPage> with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;
  int curPage = 0;
  Map<String, String> map = new Map();
  List listData = new List();
  int listTotalSize = 0;
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    getArticleList();
    //添加滚动监听事件
    addListener();
  }
  
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null || listData.isEmpty) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = new ListView.builder(
        key: new PageStorageKey(widget.id),
        itemCount: listData.length,
        itemBuilder: (context, i) => buildItem(i),
        controller: scrollController,
      );

      return new RefreshIndicator(child: listView, onRefresh: pullToRefresh);
    }
  }

  void getArticleList() {
    String url = AndroidApi.ARTICLE_LIST;
    url += "$curPage/json";
    map['cid'] = widget.id;
    HttpApiUtils.get(url, (data) {
      if (data != null) {
        Map<String, dynamic> map = data;
        var _listData = map['datas'];
        listTotalSize = map["total"];
        setState(() {
          List list1 = new List();
          if (curPage == 0) {
            listData.clear();
          }
          curPage++;
          list1.addAll(listData);
          list1.addAll(_listData);
          if (list1.length >= listTotalSize) {
            list1.add(Constants.complete);
          }
          listData = list1;
        });
      }
    }, params: map);
  }

  Future<Null> pullToRefresh() async {
    curPage = 0;
    getArticleList();
    return null;
  }

  Widget buildItem(int i) {
    var itemData = listData[i];
    if (i == listData.length - 1 && itemData.toString() == Constants.complete) {
      return new EndLine();
    }
    return new ArticleItem(itemData);
  }

  void addListener() {
    //添加滚动监听事件
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var pixels = scrollController.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        getArticleList();
      }
    });
  }
}
