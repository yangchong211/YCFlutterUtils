
import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/res/flutter_colors.dart';
import 'package:yc_flutter_utils/router/animation_type.dart';
import 'package:yc_flutter_utils/router/navigator_utils.dart';
import 'package:yc_flutter_utils_example/android/pages/detail/ArticleDetailPage.dart';
import 'package:yc_flutter_utils_example/android/pages/home/view/home_banner_view.dart';



class HomeHeaderView extends StatefulWidget {

  //轮播图
  HomeBannerView bannerView;
  int index;

  HomeHeaderView(this.index,this.bannerView);
  
  @override
  State<StatefulWidget> createState() {
    return HomeHeaderState();
  }
  
}

class HomeHeaderState extends State<HomeHeaderView>{
  @override
  Widget build(BuildContext context) {
    return addHeader(widget.index);
  }

  ///添加头部轮播图，
  Widget addHeader(int i) {
    var container = new Container(height: 180.0, child: widget.bannerView,);
    Row content = new Row(
      children: <Widget>[
        new Text('潇湘剑雨：'),
        new Expanded(
          child: new Text(
            'wanAndroid最新博文',
            softWrap: true,
            style: new TextStyle(color: FlutterColors.color_E625262D),
            textAlign: TextAlign.left,
            maxLines: 1,
          ),
        ),
      ],
    );
    //return content;
    Column column = new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(0.0),
          child: container,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 15.0),
          child: content,
        ),
      ],
    );
    return new Card(
      elevation: 0.1,
      child: new InkWell(
        child: column,
        onTap: () {
          var page = new ArticleDetailPage(
            title: '潇湘剑雨',
            url: 'https://github.com/yangchong211/YCBlogs',
          );
          NavigatorUtils.pushAnimationType(
              context, page, AnimationType.SlideRL);
        },
      ),
    );
  }

}