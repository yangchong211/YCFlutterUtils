import 'package:json_annotation/json_annotation.dart';
import 'package:yc_flutter_utils_example/android/data/base/base_entity.dart';

part 'android_article_list.g.dart';

@JsonSerializable(explicitToJson: true)
class AndroidArticleList implements BaseEntity{
  DataData  data;
  int  errorCode;
  String  errorMsg;

  AndroidArticleList();

  factory AndroidArticleList.fromJson(Map<String,dynamic> json) => _$AndroidArticleListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AndroidArticleListToJson(this);
}


@JsonSerializable(explicitToJson: true)
class DataData {
  int  curPage;
  List <DatasData>  datas;
  int  offset;
  bool  over;
  int  pageCount;
  int  size;
  int  total;

  DataData({this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total});

  factory DataData.fromJson(Map<String, dynamic> json) => _$DataDataFromJson(json);
  Map<String, dynamic> toJson() => _$DataDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DatasData {
  String  apkLink;
  int  audit;
  String  author;
  bool  canEdit;
  int  chapterId;
  String  chapterName;
  bool  collect;
  int  courseId;
  String  desc;
  String  descMd;
  String  envelopePic;
  bool  fresh;
  String  host;
  int  id;
  String  link;
  String  niceDate;
  String  niceShareDate;
  String  origin;
  String  prefix;
  String  projectLink;
  int  publishTime;
  int  realSuperChapterId;
  int  selfVisible;
  int  shareDate;
  String  shareUser;
  int  superChapterId;
  String  superChapterName;
  List <String>  tags;
  String  title;
  int  type;
  int  userId;
  int  visible;
  int  zan;

  DatasData({this.apkLink,this.audit,this.author,this.canEdit,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.descMd,this.envelopePic,this.fresh,this.host,this.id,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.realSuperChapterId,this.selfVisible,this.shareDate,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan});

  factory DatasData.fromJson(Map<String, dynamic> json) => _$DatasDataFromJson(json);
  Map<String, dynamic> toJson() => _$DatasDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TagsData {

  TagsData();

  factory TagsData.fromJson(Map<String, dynamic> json) => _$TagsDataFromJson(json);
  Map<String, dynamic> toJson() => _$TagsDataToJson(this);
}

