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
import 'package:yc_flutter_utils/sp/sp_utils.dart';
import 'package:yc_flutter_utils/toast/snack_utils.dart';
import 'package:yc_flutter_utils_example/android/api/AndroidApi.dart';
import 'package:yc_flutter_utils_example/android/res/YcColors.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/10/28
 *     desc  : 新闻item条目控件
 *     revise:
 * </pre>
 */
class LoginPage  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {

  TextEditingController username = new TextEditingController(text: 'yangchong');
  TextEditingController pwd = new TextEditingController(text: '123456');
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    Row person = initRowPerson();
    TextField name = initTextName();
    TextField password = initTextPwd();
    Row loginAndRegister = initLoginAndRegister();
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('登录'),
      ),
      body: new Padding(
        padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0.0),
        child: new ListView(
          children: <Widget>[
            person,
            new Padding(
              padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
            ),
            name,
            password,
            new Padding(
              padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
            ),
            loginAndRegister,
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  //初始化登陆头像
  Row initRowPerson() {
    Row person = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.account_circle,
          color: YcColors.colorIndigo,
          size: 100.0,
        ),
      ],
    );
    return person;
  }

  TextField initTextName() {
    TextField name = new TextField(
      autofocus: true,
      cursorColor: YcColors.colorRed,
      decoration: new InputDecoration(
        labelText: "用户名",
        fillColor: YcColors.colorBlack87,
      ),
      controller: username,
    );
    return name;
  }

  TextField initTextPwd() {
    TextField password = new TextField(
      cursorColor: YcColors.colorRed,
      decoration: InputDecoration(
          labelText: "密码",
          fillColor: YcColors.colorBlack87,
      ),
      obscureText: true,
      controller: pwd,
    );
    return password;
  }

  Row initLoginAndRegister() {
    Row loginAndRegister = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new RaisedButton(
          child: new Text(
            "开始登录",
            style: new TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
          color: Theme.of(context).accentColor,
          disabledColor: YcColors.colorPrimary,
          textColor: Colors.white,
          onPressed: () {
            login();
          },
        ),
        new RaisedButton(
          child: new Text(
            "开始注册",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
          color: YcColors.colorPrimary,
          disabledColor: YcColors.colorPrimary,
          textColor: Colors.white,
          onPressed: () {
            register();
          },
        ),
      ],
    );
    return loginAndRegister;
  }

  //登陆
  void login() {
    String name = username.text;
    String password = pwd.text;
    if (name.length == 0) {
      SnackUtils.showToast('请先输入姓名');
      return;
    }
    if (password.length == 0) {
      SnackUtils.showToast('请先输入密码');
      return;
    }
    Map<String, String> map = new Map();
    map['username'] = name;
    map['password'] = password;

    HttpApiUtils.post(AndroidApi.LOGIN, (data) async {
          SpUtils.putString("userName", name).then((value){
            Navigator.of(context).pop();
          });
        },
        params: map,
        errorCallback: (msg) {
          SnackUtils.showToast(msg);
        });
  }

  //注册
  void register() {
    String name = username.text;
    String password = pwd.text;
    if (name.length == 0) {
      SnackUtils.showToast('请先输入姓名');
      return;
    }
    if (password.length == 0) {
      SnackUtils.showToast('请先输入密码');
      return;
    }
    Map<String, String> map = new Map();
    map['username'] = name;
    map['password'] = password;
    map['repassword'] = password;

    HttpApiUtils.post(AndroidApi.REGISTER, (data) async {
      SpUtils.putString("userName", name).then((r) {
          Navigator.of(context).pop();
        });
      },
      params: map,
      errorCallback: (msg) {
        SnackUtils.showToast(msg);
      });
  }
}