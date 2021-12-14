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
import 'package:flutter/scheduler.dart';
import 'package:yc_flutter_utils_example/android/pages/find/HierarchyListPage.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/8/22
 *     desc  : 知识体系tab页面
 *     revise:
 * </pre>
 */
class HierarchyPage extends StatefulWidget{

  var data;
  HierarchyPage(itemData){
    this.data = itemData;
  }

  @override
  State<StatefulWidget> createState() {
    return new HierarchyState();
  }

}

class HierarchyState extends State<HierarchyPage> with SingleTickerProviderStateMixin{

  TabController tabController;
  List<Tab> tabs = new List();
  List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.data['name']),
        ),
        body: new DefaultTabController(
          length: list.length,
          child: new Scaffold(
              appBar: new TabBar(
                isScrollable: true,
                controller: tabController,
                labelColor: Theme.of(context).accentColor,
                unselectedLabelColor: Colors.black,
                indicatorColor: Theme.of(context).accentColor,
                tabs: tabs,
              ),
              body: new TabBarView(
                controller: tabController,
                children: list.map((dynamic itemData) {
                  var id = itemData['id'].toString();
                  return new HierarchyListPage(id);
                }).toList(),
              )),
        ));
  }

  @override
  void initState() {
    super.initState();
    list = widget.data['children'];
    //遍历添加tab
    for (var value in list) {
      tabs.add(new Tab(text: value['name']));
    }
    //创建TabController对象
    tabController = new TabController(length: list.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

}
