import 'package:flutter/services.dart';
import 'package:yc_flutter_plugin/base/base_constants.dart';

/// 这个使用原生NA的日志打印
class LoggerPlugin {

  MethodChannel _loggerPlugin =
      MethodChannel(BaseConstants.PATH_LOG_KEY, JSONMethodCodec());

  String _tag;

  LoggerPlugin(this._tag) : assert(_tag != null);

  void info(dynamic param) {
    _printLog("info", param);
  }

  void debug(dynamic param) {
    _printLog("debug", param);
  }

  void error(dynamic param) {
    _printLog("error", param);
  }

  void warning(dynamic param) {
    _printLog("warning", param);
  }

  void _printLog(String level, dynamic param) {
    if (bool.fromEnvironment("dart.vm.product")) {
      _loggerPlugin.invokeMethod(level, {
        "tag": _tag,
        "param": param,
      });
    } else {
      print("$_tag $param");
    }
  }
}
