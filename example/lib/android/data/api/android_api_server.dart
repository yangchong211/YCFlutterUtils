

import 'dart:convert';

import 'package:yc_flutter_utils/dio/http_response.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';
import 'package:yc_flutter_utils_example/android/data/api/api_request_helper.dart';
import 'package:yc_flutter_utils_example/android/data/bean/android_article_list.dart';

class AndroidApiServer{

  /// 数据请求
  static Future<AndroidArticleList> requestAndroidArticleList(String url) async {
    HttpResponse result = await ApiRequestHelper.get(url);
    if (result!=null && result.data!=null) {
      final value = AndroidArticleList.fromJson(result.data);
      return value;
    } else {
      return result.data;
    }
  }

  /// 数据请求
  static Future<AndroidArticleList> requestAndroidBanner(String url) async {
    HttpResponse result = await ApiRequestHelper.get(url);
    if (result!=null && result.data!=null) {
      final value = AndroidArticleList.fromJson(result.data);
      return value;
    } else {
      return result.data;
    }
  }



}