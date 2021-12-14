
import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/res/flutter_colors.dart';
import 'package:yc_flutter_utils_example/android/pages/base/view_model/select_dialog_view_model.dart';


class SelectDialogView extends StatefulWidget{

  final int type;

  SelectDialogView({Key key , this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SelectDialogState();
  }
}

class SelectDialogState extends State<SelectDialogView>{

  SelectDialogViewModel _viewModel;
  int _radioValue = 0;

  @override
  void initState() {
    super.initState();
    _viewModel = new SelectDialogViewModel();
    Future(() async {
      await _viewModel.addSelectData();
      _refreshDialogView();
    });
    _viewModel.setCallBackRefresh(_refreshDialogView);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              20,
              0,
              20,
              20
          ),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              "请选择合适的方式",
              // "请选择默认的导航类型",
              textAlign: TextAlign.left,
              style: new TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
              //超过2行省略符“...”表示
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
          child: Container(height: 1, color: FlutterColors.color_E5),
        ),
        SizedBox(
          height: 150,
          child: new ListView.builder(
            padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            itemCount: 3,
            itemExtent: 50.0,
            itemBuilder: (BuildContext context, int index) {
              return buildListItem(context,index);
            },
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              20, 20, 20, 50
          ),
          child: new Row(
            children: <Widget>[
              Expanded(
                child: new Container(
                  height: 48,
                  child: new OutlineButton(
                      textColor: FlutterColors.color_99,
                      highlightedBorderColor: FlutterColors.color_E5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      borderSide: new BorderSide(color: FlutterColors.color_CC),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text("取消")
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: new Container(
                  height: 48,
                  child: FlatButton(
                    color: FlutterColors.color_FF6325,
                    highlightColor: FlutterColors.color_FF6325,
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("确定"),
                    //这个是设置圆角的
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      if(_viewModel.listTitle.length>0){
                        //同步状态给NA
                        _viewModel.setNavType(_radioValue);
                      } else {
                        //未安装跳转应用市场详情页
                        _viewModel.toNavAppDetail(_radioValue);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: new Text(_viewModel.listTitle.length>0 ?
            _viewModel.listTitle[index].name : "",
            style: new TextStyle(
              fontSize: 14,
              color: FlutterColors.color_99,
            ),
          ),
        ),
        Radio(
          //此单选按钮表示的值
          value: index,
          //一组单选按钮当前选定的值
          groupValue: _radioValue,
          onChanged: (value){
            //需要刷新布局
            setState(() {
              _radioValue = value;
            });
          },
        ),
      ],
    );
    return row;
  }

  /// 刷新一下
  void _refreshDialogView(){
    if (mounted) {
      setState((){});
    }
  }

}


