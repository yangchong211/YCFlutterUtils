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
import 'package:yc_flutter_utils_example/android/pages/todo/serviceCard.dart';
import 'package:yc_flutter_utils_example/android/res/YcColors.dart';
import 'package:yc_flutter_utils_example/android/weight/wallpager/BannerPageView.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/12/09
 *     desc  : todo页面
 *     revise:
 * </pre>
 */
class TodoPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TodoState();
  }
}

class TodoState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    var bannerPageView = new BannerPageView();
    var container = new Container(height: 180.0, child: bannerPageView,);
    return new Scaffold(
        body: new SingleChildScrollView(
          child: new Container(
            color: YcColors.colorWhite,
            child: new Column(
              children: <Widget>[
                container,
                serviceView(context),
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }

}