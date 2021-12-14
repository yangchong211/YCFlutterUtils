// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_home_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AndroidHomeBanner _$AndroidHomeBannerFromJson(Map<String, dynamic> json) {
  return AndroidHomeBanner()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataData.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$AndroidHomeBannerToJson(AndroidHomeBanner instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

DataData _$DataDataFromJson(Map<String, dynamic> json) {
  return DataData(
    desc: json['desc'] as String,
    id: json['id'] as int,
    imagePath: json['imagePath'] as String,
    isVisible: json['isVisible'] as int,
    order: json['order'] as int,
    title: json['title'] as String,
    type: json['type'] as int,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$DataDataToJson(DataData instance) => <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
