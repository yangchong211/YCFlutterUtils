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
import 'package:yc_flutter_utils_example/android/pages/detail/ArticleDetailPage.dart';
import 'package:yc_flutter_utils_example/android/res/TextStyles.dart';
import 'package:yc_flutter_utils_example/android/res/YcColors.dart';
import 'package:yc_flutter_utils_example/widget/popup/popup_window.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/9/12
 *     desc  : 关于我的页面
 *     revise:
 * </pre>
 */
class AboutMePage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AboutMeState();
  }
}

class AboutMeState extends State<AboutMePage> {

  GlobalKey addKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget icon = initImage();
    Widget about = initAboutWidget();
    Widget api = initApiWidget();
    Widget zhy = initZhyWidget();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("关于我"),
        actions: <Widget>[
          IconButton(
            key: addKey,
            onPressed: (){
              showAddMenu();
            },
            icon: new Icon(Icons.add,),
          ),
        ],
      ),
      body: new ListView(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        children: <Widget>[
          icon,
          about,
          api,
          new ListTile(
              title: const Text('直接微信搜索‘鸿洋’关注即可'),
              subtitle: const Text('一个长期分享Android相关的技术干货，质量也很高，值得程序员每天看看'),
              trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
              onTap: () {
                Navigator
                    .of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new ArticleDetailPage(
                    title: '鸿洋公众号',
                    url: 'http://www.wanandroid.com',
                  );
                }));
              }),
          zhy,
        ],
      ),
    );
  }

  Widget initImage() {
    Widget icon = new Image.asset(
      'lib/image/zhy.jpg',
      width: 150.0,
      height: 150.0,
    );
    return icon;
  }

  Widget initAboutWidget() {
    Widget layout = new ListTile(
        title: const Text('关于项目'),
        subtitle: const Text('在学习Flutter的时候写的练手项目，用的是鸿洋大神的开发接口，模仿WanAndroid客户端，实现了其大部分的功能效果，后期慢慢完善'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () {
          Navigator
              .of(context)
              .push(new MaterialPageRoute(builder: (context) {
            return new ArticleDetailPage(
              title: 'WanAndroid_Flutter版',
              url: 'https://github.com/yangchong211',
            );
          }));
        });
    return layout;
  }

  Widget initApiWidget() {
    Widget layout = new ListTile(
        title: const Text('关于开放Api接口'),
        subtitle: const Text('玩Android 开放API'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new ArticleDetailPage(
              title: '张鸿洋的学习网站',
              url: 'http://www.wanandroid.com',
            );
          }));
        });
    return layout;
  }


  Widget initZhyWidget() {
    Widget layout = new ListTile(
        title: const Text('保存鸿洋公众号到本地'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () {

        });
    return layout;
  }


  void showAddMenu() {
    final RenderBox button = addKey.currentContext.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    var a =  button.localToGlobal(Offset(button.size.width - 8.0, button.size.height - 12.0), ancestor: overlay);
    var b =  button.localToGlobal(button.size.bottomLeft(Offset(0, - 12.0)), ancestor: overlay);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(a, b),
      Offset.zero & overlay.size,
    );
    showPopupWindow(
      context: context,
      fullWidth: false,
      isShowBg: true,
      position: position,
      elevation: 0.0,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: (){

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Image.asset("lib/image/jt.png", width: 8.0, height: 4.0,),
            ),
            Container(
              width: 120.0,
              height: 40.0,
              child: FlatButton.icon(
                  onPressed: (){

                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  ),
                  icon: new Icon(Icons.share),
                  label: Text("分享微信", style: TextStyles.textDark12,)
              ),
            ),
            Container(width: 120.0, height: 0.6, color: YcColors.line),
            Container(
              width: 120.0,
              height: 40.0,
              child: FlatButton.icon(
                  color: Colors.white,
                  onPressed: (){

                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                  ),
                  icon: new Icon(Icons.android),
                  label: Text("GitHub", style: TextStyles.textDark12)
              ),
            ),
          ],
        ),
      ),
    );
  }

}