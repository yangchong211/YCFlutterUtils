
import 'package:yc_flutter_utils/screen/screen_adaptation_utils.dart';
import 'package:yc_flutter_utils/screen/screen_adaption.dart';
import 'package:yc_flutter_utils/sp/sp_utils.dart';

/// 初始化工具类
class FlutterInitUtils {

  ///初始化操作
  static Future<void> fetchInitUtils() async {
    //初始化sp工具类
    Future(() async {
      await SpUtils.init();
    });
    // 初始化屏幕适配
    ScreenAdaptationUtils.init(ScreenAdaptation.none());
  }

}