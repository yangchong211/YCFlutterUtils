
import 'package:json_annotation/json_annotation.dart';

part 'android_home_banner.g.dart';

@JsonSerializable(explicitToJson: true)
class AndroidHomeBanner {
  List <DataData>  data;
  int  errorCode;
  String  errorMsg;

  AndroidHomeBanner();

  factory AndroidHomeBanner.fromJson(Map<String,dynamic> json) => _$AndroidHomeBannerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AndroidHomeBannerToJson(this);
}


@JsonSerializable(explicitToJson: true)
class DataData {
  String  desc;
  int  id;
  String  imagePath;
  int  isVisible;
  int  order;
  String  title;
  int  type;
  String  url;

  DataData({this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url});

  factory DataData.fromJson(Map<String, dynamic> json) => _$DataDataFromJson(json);
  Map<String, dynamic> toJson() => _$DataDataToJson(this);
}

