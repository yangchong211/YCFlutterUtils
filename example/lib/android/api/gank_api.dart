


import 'package:yc_flutter_utils/dio/http_manager.dart';
import 'package:yc_flutter_utils/dio/http_response.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';

class GankApi{

  /// gank api urls.
  static const String API_GANK_HOST = 'http://gank.io';
  static const String API_SPECIAL_DAY = "$API_GANK_HOST/api/day/";
  static const String API_DATA = "$API_GANK_HOST/api/data/";
  static const String API_SEARCH = "$API_GANK_HOST/api/search/query";
  static const String API_TODAY = "$API_GANK_HOST/api/today";
  static const String API_HISTORY = "$API_GANK_HOST/api/day/history";
  static const String API_HISTORY_CONTENT = "$API_GANK_HOST/api/history/content";
  static const String API_SUBMIT = "$API_GANK_HOST/api/add2gank";
  static const String CHECK_UPDATE = "$API_GANK_HOST/api/checkversion";


  ///获取分类数据 [category:分类, page: 页数, count:每页的个数]
  static getCategoryData(String category, int page, {count = 20}) async {
    String url = API_DATA + category + "/$count/$page";
    LogUtils.d("GankApi------getCategoryData---"+url);
    HttpResponse response = await HttpManager.instance.request(url);
    return response.data;
  }

}









