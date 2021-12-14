// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_tree_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AndroidTreeList _$AndroidTreeListFromJson(Map<String, dynamic> json) {
  return AndroidTreeList()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataData.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$AndroidTreeListToJson(AndroidTreeList instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

DataData _$DataDataFromJson(Map<String, dynamic> json) {
  return DataData(
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : ChildrenData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    courseId: json['courseId'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    order: json['order'] as int,
    parentChapterId: json['parentChapterId'] as int,
    userControlSetTop: json['userControlSetTop'] as bool,
    visible: json['visible'] as int,
  );
}

Map<String, dynamic> _$DataDataToJson(DataData instance) => <String, dynamic>{
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };

ChildrenData _$ChildrenDataFromJson(Map<String, dynamic> json) {
  return ChildrenData(
    courseId: json['courseId'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    order: json['order'] as int,
    parentChapterId: json['parentChapterId'] as int,
    userControlSetTop: json['userControlSetTop'] as bool,
    visible: json['visible'] as int,
  );
}

Map<String, dynamic> _$ChildrenDataToJson(ChildrenData instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
