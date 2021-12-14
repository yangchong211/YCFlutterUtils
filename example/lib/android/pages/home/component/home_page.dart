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
import 'package:yc_flutter_utils/res/flutter_colors.dart';
import 'package:yc_flutter_utils_example/android/api/AndroidApi.dart';
import 'package:yc_flutter_utils_example/android/data/api/android_api_server.dart';
import 'package:yc_flutter_utils_example/android/pages/home/view/home_banner_view.dart';
import 'package:yc_flutter_utils_example/android/pages/home/view/home_header_view.dart';
import 'package:yc_flutter_utils_example/android/pages/home/view_model/home_page_model.dart';
import 'package:yc_flutter_utils_example/android/utils/Constants.dart';
import 'package:yc_flutter_utils_example/android/weight/EndLine.dart';


import 'article_item.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/8/22
 *     desc  : 首页面
 *     revise:
 * </pre>
 */
class HomePage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<HomePage> {

  ScrollController scrollController = new ScrollController();
  //轮播图
  HomeBannerView bannerView;
  HomePageModel _homePageModel;

  //这个方法必须写
  @override
  Widget build(BuildContext context) {
    //不要用下面这个方式判空
    //var isEmpty = listData.isEmpty;
    if(_homePageModel.listData == null || _homePageModel.listData.length == 0){
      //展示progress
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      return getWillPopScope();
    }
  }

  ///WillPopScope，做返回键的逻辑处理
  WillPopScope getWillPopScope(){
    return new WillPopScope(
      child: new Scaffold(
        body: getHome(),
        floatingActionButton: !_homePageModel.showToTopBtn ? null : FloatingActionButton(
          onPressed: (){
            scrollToTopPage();
          },
          tooltip: 'Increment',
          child: Icon(Icons.vertical_align_top),
          mini:true,
        ), // This t
      ),
      onWillPop: () async {
        if (_homePageModel.lastPressedAt == null ||
            DateTime.now().difference(_homePageModel.lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _homePageModel.lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
    );
  }


  //构造方法
  HomeState(){
    addListener();
  }

  //初始化操作
  //更多可以看：https://github.com/yangchong211/YCBlogs
  @override
  void initState() {
    super.initState();
    _homePageModel = new HomePageModel();
    _homePageModel.requestBannerData();
    getBanner();
    getMoreList();
  }

  @override
  void dispose() {
    //防止内存泄漏
    scrollController.dispose();
    super.dispose();
  }


  Widget getHome(){
    return Stack(
      children: [
        getBody(),
      ],
    );
  }

  Widget getBody(){
    Widget listView = new ListView.builder(
      itemCount: _homePageModel.listData.length + 1,
      //兰等表达式
      //itemBuilder: (context, i) => buildItem(i),
      itemBuilder: (BuildContext context, int index){
        return buildItem(index);
      },
      controller: scrollController,
    );
    Widget body = new RefreshIndicator(child: listView, onRefresh: pullToRefresh);
    return body;
  }


  void addListener() {
    //添加滚动监听事件
    scrollController.addListener(() {
      var offset = scrollController.offset;
      var position = scrollController.position;
      var maxScroll = position.maxScrollExtent;
      var pixels = position.pixels;
      if (maxScroll == pixels && _homePageModel.listData.length < _homePageModel.listTotalSize) {
        getMoreList();
      }
      if (offset < 300) {
        setState(() {
          _homePageModel.showToTopBtn = false;
        });
      } else if (offset >= 300) {
        setState(() {
          _homePageModel.showToTopBtn = true;
        });
      }
    });
  }

  ///滚动到顶部
  void scrollToTopPage() {
    //返回到顶部时执行动画
    scrollController.animateTo(.0,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease
    );
  }


  ///刷新控件
  Future<Null> pullToRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('refresh');
      setState(() {
        _homePageModel.curPage = 0;
        getBanner();
        getMoreList();
      });
    });
  }

  ///获取轮播图
  void getBanner() {
    String bannerUrl = AndroidApi.BANNER;
    //请求接口
    HttpApiUtils.get(bannerUrl, (data) {
      if (data != null) {
        setState(() {
          _homePageModel.bannerData = data;
          bannerView = new HomeBannerView(_homePageModel.bannerData);
        });
      }
    });
  }

  ///获取更多数据
  ///逗比，看到这里，记得给项目点个star，谢谢。
  ///GitHub：https://github.com/yangchong211/ycflutter
  Future getMoreList() async {
    if (!_homePageModel.isLoading) {
      setState(() {
        _homePageModel.isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2), () {
        print('加载更多');
        // _homePageModel.requestHomeListData().then((data) => () {
        //   if (data != null) {
        //     var _listData = data.data.datas;
        //     _homePageModel.listTotalSize = data.data.total;
        //     setState(() {
        //       List list1 = new List();
        //       if (_homePageModel.curPage == 0) {
        //         _homePageModel.listData.clear();
        //       }
        //       _homePageModel.curPage++;
        //       list1.addAll(_homePageModel.listData);
        //       list1.addAll(_listData);
        //       if (list1.length >= _homePageModel.listTotalSize) {
        //         list1.add(Constants.complete);
        //       }
        //       _homePageModel.listData = list1;
        //     });
        //   }
        // });
        getHomeList();
        _homePageModel.isLoading = false;
      });
    }
  }

  ///获取主页数据
  void getHomeList() {
    _homePageModel.isLoading = false;
    String url = AndroidApi.ARTICLE_LIST;
    url += "${_homePageModel.curPage}/json";
    AndroidApiServer.requestAndroidArticleList(url).then((data){
      if (data != null) {
        var _listData = data.data.datas;
        _homePageModel.listTotalSize = data.data.total;
        setState(() {
          List list1 = new List();
          if (_homePageModel.curPage == 0) {
            _homePageModel.listData.clear();
          }
          _homePageModel.curPage++;
          list1.addAll(_homePageModel.listData);
          list1.addAll(_listData);
          if (list1.length >= _homePageModel.listTotalSize) {
            list1.add(Constants.complete);
          }
          _homePageModel.listData = list1;
        });
      }
    });
  }

  Widget buildItem(int index) {
    if (index < _homePageModel.listData.length) {
      //添加header头部
      if (index == 0) {
        return new HomeHeaderView(index,bannerView);
      }
      index -= 1;
      var itemData = _homePageModel.listData[index];
      //添加没有更多
      if (itemData is String && itemData == Constants.complete) {
        return new EndLine();
      }
      //添加博文item
      return new ArticleItem(itemData);
    }
    return getMoreWidget();
  }

  ///加载更多
  Widget getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text('加载中...',
              style: TextStyle(
                  fontSize: 14.0,
                  color: FlutterColors.color_E625262D,
              ),
            ),
            new CircularProgressIndicator(
              strokeWidth: 1.0,
              //backgroundColor: YcColors.colorPrimary,
            )
          ],
        ),
      ),
    );
  }

}

