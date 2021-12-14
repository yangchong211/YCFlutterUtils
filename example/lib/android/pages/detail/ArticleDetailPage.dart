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
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:yc_flutter_utils/res/flutter_colors.dart';
import 'package:yc_flutter_utils_example/android/res/TextStyles.dart';
import 'package:yc_flutter_utils_example/widget/popup/popup_window.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/10/12
 *     desc  : 文章详情界面
 *     revise:
 * </pre>
 */
// ignore: must_be_immutable
class ArticleDetailPage extends StatefulWidget {
  //标题
  String title;
  //链接
  String url;

  ArticleDetailPage({Key key, @required this.title, @required this.url,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ArticleDetailPageState();
  }
}

class ArticleDetailPageState extends State<ArticleDetailPage> {

  bool isLoad = true;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();
  GlobalKey addKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onStateChanged.listen((state) {
      debugPrint('state:_' + state.type.toString());
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {isLoad = false;});
      } else if (state.type == WebViewState.startLoad) {
        setState(() {isLoad = true;});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          IconButton(
            key: addKey,
            onPressed: (){
              showAddMenu();
            },
            icon: new Icon(Icons.add,),
          ),
        ],
        bottom: new PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: isLoad
                ? new LinearProgressIndicator()
                : new Divider(
                    height: 1.0,
                    color: Theme.of(context).primaryColor,
                  )),
      ),
      url: widget.url,
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
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
            Container(width: 120.0, height: 0.6, color: FlutterColors.color_66),
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
