import 'package:json_annotation/json_annotation.dart';

part 'android_hotkey_list.g.dart';

@JsonSerializable(explicitToJson: true)
class AndroidHotkeyList {
  List <DataData>  data;
  int  errorCode;
  String  errorMsg;

  AndroidHotkeyList();

  factory AndroidHotkeyList.fromJson(Map<String,dynamic> json) => _$AndroidHotkeyListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AndroidHotkeyListToJson(this);
}


@JsonSerializable(explicitToJson: true)
class DataData {
  int  id;
  String  link;
  String  name;
  int  order;
  int  visible;

  DataData({this.id,this.link,this.name,this.order,this.visible});

  factory DataData.fromJson(Map<String, dynamic> json) => _$DataDataFromJson(json);
  Map<String, dynamic> toJson() => _$DataDataToJson(this);
}

