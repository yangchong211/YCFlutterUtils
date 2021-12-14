


import 'package:yc_flutter_utils/dio/http_manager.dart';
import 'package:yc_flutter_utils/dio/http_method.dart';
import 'package:yc_flutter_utils/dio/http_response.dart';
import 'package:yc_flutter_utils_example/android/data/api/android_api_url.dart';

class ApiRequestHelper{


  static Future<HttpResponse> post(String url , {Map<String, dynamic> params}) async {
    String requestUrl = AndroidApiUrl.BASE_URL + url;
    HttpResponse result = await HttpManager.instance.request(requestUrl
        ,method : HttpMethod.post);
    return Future.value(result);
  }

  static Future<HttpResponse> get(String url , {Map<String, dynamic> params}) async {
    String requestUrl = AndroidApiUrl.BASE_URL + url;
    HttpResponse result = await HttpManager.instance.request(requestUrl
        ,method : HttpMethod.get);
    return Future.value(result);
  }


}