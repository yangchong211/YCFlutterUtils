import 'package:json_annotation/json_annotation.dart';

part 'android_tree_list.g.dart';

@JsonSerializable(explicitToJson: true)
class AndroidTreeList {
  List <DataData>  data;
  int  errorCode;
  String  errorMsg;

  AndroidTreeList();

  factory AndroidTreeList.fromJson(Map<String,dynamic> json) => _$AndroidTreeListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AndroidTreeListToJson(this);
}


@JsonSerializable(explicitToJson: true)
class DataData {
  List <ChildrenData>  children;
  int  courseId;
  int  id;
  String  name;
  int  order;
  int  parentChapterId;
  bool  userControlSetTop;
  int  visible;

  DataData({this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible});

  factory DataData.fromJson(Map<String, dynamic> json) => _$DataDataFromJson(json);
  Map<String, dynamic> toJson() => _$DataDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChildrenData {
  // List <String>  children;
  int  courseId;
  int  id;
  String  name;
  int  order;
  int  parentChapterId;
  bool  userControlSetTop;
  int  visible;

  ChildrenData({this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible});

  factory ChildrenData.fromJson(Map<String, dynamic> json) => _$ChildrenDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChildrenDataToJson(this);
}

// @JsonSerializable(explicitToJson: true)
// class ChildrenData {
//
//   ChildrenData();
//
//   factory ChildrenData.fromJson(Map<String, dynamic> json) => _$ChildrenDataFromJson(json);
//   Map<String, dynamic> toJson() => _$ChildrenDataToJson(this);
// }

