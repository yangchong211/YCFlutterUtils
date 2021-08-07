library platform_utils;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 平台获取类型工具类
class PlatformUtils {

  /// 返回值或运行基于平台的函数。
  /// 如果传递了上下文，它将通过 Theme.of(context).platform 获取平台。
  /// 否则，它将使用 defaultTargetPlatform。
  static get({BuildContext context}) {
    return context != null ? Theme.of(context).platform : defaultTargetPlatform;
  }

  static T select<T>({BuildContext context, dynamic android, dynamic ios,
    dynamic fuchsia, dynamic web, dynamic macOS,dynamic windows,
    dynamic linux,dynamic defaultWhenNull}) {
    var func;
    if (kIsWeb) {
      func = web;
    } else {
      func = {
        TargetPlatform.iOS: ios,
        TargetPlatform.android: android,
        TargetPlatform.fuchsia: fuchsia,
        TargetPlatform.macOS: macOS,
        TargetPlatform.windows: windows,
        TargetPlatform.linux: linux,
      }[get(context: context)];
    }
    if (func is Function) {
      return func();
    }
    if (func == null && defaultWhenNull is Function) {
      return defaultWhenNull();
    }
    return func ?? defaultWhenNull;
  }
}
