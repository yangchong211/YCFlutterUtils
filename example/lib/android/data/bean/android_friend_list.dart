import 'package:json_annotation/json_annotation.dart';

part 'android_friend_list.g.dart';

@JsonSerializable(explicitToJson: true)
class AndroidFriendList {
  List <DataData>  data;
  int  errorCode;
  String  errorMsg;

  AndroidFriendList();

  factory AndroidFriendList.fromJson(Map<String,dynamic> json) => _$AndroidFriendListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AndroidFriendListToJson(this);
}


@JsonSerializable(explicitToJson: true)
class DataData {
  String  category;
  String  icon;
  int  id;
  String  link;
  String  name;
  int  order;
  int  visible;

  DataData({this.category,this.icon,this.id,this.link,this.name,this.order,this.visible});

  factory DataData.fromJson(Map<String, dynamic> json) => _$DataDataFromJson(json);
  Map<String, dynamic> toJson() => _$DataDataToJson(this);
}

