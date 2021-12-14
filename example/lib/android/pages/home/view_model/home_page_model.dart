



import 'package:yc_flutter_utils_example/android/api/AndroidApi.dart';
import 'package:yc_flutter_utils_example/android/data/api/android_api_server.dart';
import 'package:yc_flutter_utils_example/android/data/bean/android_article_list.dart';

class HomePageModel{

  List listData = new List();
  var bannerData;
  //加载的页数
  var curPage = 0;
  var listTotalSize = 0;
  //是否正在加载数据
  bool isLoading = false;
  //是否显示“返回到顶部”按钮
  bool showToTopBtn = false;
  //上次点击时间
  DateTime lastPressedAt;

  void requestBannerData() {

  }

  /// 获取主页数据
  Future<AndroidArticleList> requestHomeListData() async {
    isLoading = false;
    String url = AndroidApi.ARTICLE_LIST;
    url += "$curPage/json";
    AndroidArticleList data = await AndroidApiServer.requestAndroidArticleList(url);
    return Future.value(data);
  }




}
