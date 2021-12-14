// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_hotkey_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AndroidHotkeyList _$AndroidHotkeyListFromJson(Map<String, dynamic> json) {
  return AndroidHotkeyList()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataData.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$AndroidHotkeyListToJson(AndroidHotkeyList instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

DataData _$DataDataFromJson(Map<String, dynamic> json) {
  return DataData(
    id: json['id'] as int,
    link: json['link'] as String,
    name: json['name'] as String,
    order: json['order'] as int,
    visible: json['visible'] as int,
  );
}

Map<String, dynamic> _$DataDataToJson(DataData instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
