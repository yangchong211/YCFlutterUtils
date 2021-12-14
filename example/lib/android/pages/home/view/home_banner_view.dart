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
import 'package:yc_flutter_utils/router/navigator_utils.dart';
import 'package:yc_flutter_utils_example/android/pages/detail/ArticleDetailPage.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/9/11
 *     desc  : 轮播图view
 *     revise:
 * </pre>
 */
class HomeBannerView extends StatefulWidget {

  var data;
  HomeBannerView(data){
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return new BannerViewState(data);
  }
}

class BannerViewState extends State<HomeBannerView> with SingleTickerProviderStateMixin {
  TabController tabController;
  List data;

  BannerViewState(this.data);

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: data == null ? 0 : data.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (data != null && data.length > 0) {
      for (var i = 0; i < data.length; i++) {
        var item = data[i];
        var imgUrl = item['imagePath'];
        var title = item['title'];
        item['link'] = item['url'];
        items.add(new GestureDetector(
            onTap: () {
              onBannerClick(item);
            },
            child: AspectRatio(
              aspectRatio: 2.0 / 1.0,
              child: new Stack(
                children: <Widget>[
                  new Image.network(imgUrl, fit: BoxFit.cover, width: 1000.0,),
                  new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: new Container(
                      width: 1000.0,
                      color: const Color(0x50000000),
                      padding: const EdgeInsets.all(5.0),
                      child: new Text(title,
                          style: new TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ),
                ],
              ),
            )));
      }
    }
    return new TabBarView(
      controller: tabController,
      children: items,
    );
  }

  //轮播图点击事件
  //https://github.com/yangchong211/YCBlogs
  void onBannerClick(itemData) {
    var materialPageRoute = new ArticleDetailPage(
        title:itemData['title'],url: itemData['link']);
    NavigatorUtils.push(context, materialPageRoute);
  }
}
