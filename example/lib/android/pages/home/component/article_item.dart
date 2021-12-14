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
import 'package:yc_flutter_utils/res/flutter_colors.dart';
import 'package:yc_flutter_utils/sp/sp_utils.dart';
import 'package:yc_flutter_utils_example/android/api/AndroidApi.dart';
import 'package:yc_flutter_utils_example/android/data/bean/android_article_list.dart';
import 'package:yc_flutter_utils_example/android/pages/detail/ArticleDetailPage.dart';
import 'package:yc_flutter_utils_example/android/pages/me/LoginPage.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/9/12
 *     desc  : 新闻item条目控件
 *     revise:
 * </pre>
 */
class ArticleItem extends StatefulWidget{

  //条目的数据data
  DatasData itemData;
  //是否来自搜索列表
  bool isSearch;
  //搜索数据需要用到id
  var id ;

  //构造方法
  ArticleItem(itemData){
    this.itemData = itemData;
    this.isSearch =false;
  }

  //命名构造函数,搜索列表的item和普通的item有些不一样
  ArticleItem.isFromSearch(var itemData, String id) {
    this.itemData = itemData;
    this.isSearch = true;
    this.id = id;
  }

  @override
  State<StatefulWidget> createState() {
    return new ArticleView();
  }
}

class ArticleView  extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    //是否收藏
    bool isCollect = widget.itemData.collect;

    Row row1 = initRowView1(isCollect);
    Row content = initRowContent();
    Row row2 = initRowView2();
    Column column = initColumn(row1,content,row2);
    return new Card(
      elevation: 4.0,
      child: new InkWell(
        child: column,
        onTap: () {
          //条目点击事件
          onItemClick(widget.itemData);
        },
      ),
    );
  }

  Row initRowView1(bool isCollect) {
    String author = widget.itemData.author;
    Row row = new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Expanded(
            child: new Row(
              children: <Widget>[
                new Text('作者:  '),
                new Text(
                  author,
                  style: new TextStyle(color: FlutterColors.color_2EBFD9),
                ),
              ],
            )),
        new GestureDetector(
          child: new Icon(
            isCollect ? Icons.favorite : Icons.favorite_border,
            color: isCollect ? FlutterColors.color_FF6A60 : null,
          ),
          onTap: () {
            //收藏点击事件
            onCollectClick(widget.itemData);
          },
        ),
        //分割间距
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        ),
        new GestureDetector(
          child: new Icon(
            Icons.share , color: FlutterColors.color_2EBFD9 ,
          ),
          onTap: () {
            //分享点击事件
            onShareClick(widget.itemData);
          },
        ),
      ],
    );
    return row;
  }

  Row initRowContent() {
    Row content = new Row(
      children: <Widget>[
        new Expanded(
          child: new Text.rich(
            widget.isSearch
                ? getTextSpan(widget.itemData.title, widget.id)
                : new TextSpan(text: widget.itemData.title),
            softWrap: true,
            style: new TextStyle(fontSize: 16.0, color: FlutterColors.color_FF6A60),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
    return content;
  }

  // 保存用户登录信息，data中包含了token等信息
  static TextSpan getTextSpan(String text, String key) {
    if (text == null || key == null) {
      return null;
    }
    String splitString1 = "<em class='highlight'>";
    String splitString2 = "</em>";
    String textOrigin = text.replaceAll(splitString1, '').replaceAll(splitString2, '');
    TextSpan textSpan = new TextSpan(text: key, style: new TextStyle(color: FlutterColors.color_2EBFD9));
    List<String> split = textOrigin.split(key);
    List<TextSpan> list = new List<TextSpan>();
    for (int i = 0; i < split.length; i++) {
      list.add(new TextSpan(text: split[i]));
      list.add(textSpan);
    }
    list.removeAt(list.length - 1);
    return new TextSpan(children: list);
  }

  Row initRowView2() {
    var date = widget.itemData.niceDate;
    String time = '发布时间：'+date;
    var chapterName = widget.itemData.chapterName;
    var superChapterName = widget.itemData.superChapterName;
    String author = superChapterName + "/" + chapterName;
    Row row = new Row(
      children: <Widget>[
        new Text('分类：'),
        new Expanded(
          child: new Text(
            widget.isSearch ? '' : author,
            softWrap: true,
            style: new TextStyle(color: FlutterColors.color_FF6A60),
            textAlign: TextAlign.left,
            maxLines: 1,
          ),
        ),
        new Text(time)
      ],
    );
    return row;
  }

  Column initColumn(Row row1, Row content, Row row2) {
    Column column = new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: row1,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: content,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          child: row2,
        ),
      ],
    );
    return column;
  }

  //条目点击事件
  //更多查看：https://github.com/yangchong211/YCBlogs
  void onItemClick(itemData) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new ArticleDetailPage(
        title: itemData['title'],
        url: itemData['link'],
      );
    }));
  }

  //收藏点击事件
  //更多查看：https://github.com/yangchong211/YCBlogs
  void onCollectClick(itemData) {
    var isLogin = SpUtils.getBool("isLogin");
    if (!isLogin) {
      startLogin();
    } else {
      collectItem(itemData);
    }
  }

  //开始登陆，跳转登陆的页面
  void startLogin() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new LoginPage();
    }));
  }

  //收藏或者取消收藏
  void collectItem(itemData) {
    String url;
    if (itemData['collect']) {
      url = AndroidApi.UN_COLLECT_ORIGIN;
    } else {
      url = AndroidApi.COLLECT;
    }
    url += '${itemData["id"]}/json';
    HttpApiUtils.post(url, (data) {
      setState(() {
        itemData['collect'] = !itemData['collect'];
      });
    });
  }

  //开始分享
  void onShareClick(itemData) {

  }
}
