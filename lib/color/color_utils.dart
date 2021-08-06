
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';
import 'package:yc_flutter_utils/object/object_utils.dart';
import 'package:yc_flutter_utils/regex/regex_constants.dart';
import 'package:yc_flutter_utils/regex/regex_utils.dart';
import 'package:yc_flutter_utils/text/text_utils.dart';

///颜色工具类
class ColorUtils{

  ///颜色值通常遵循RGB/ARGB标准
  ///使用时通常以“ # ”字符开头的8位16进制表示
  ///其中ARGB 依次代表透明度（Alpha）、红色(Red)、绿色(Green)、蓝色(Blue)
  ///RGB/ARGB(A表示透明度)
  ///RGB       #RGB888
  ///ARGB      #00RGB888
  ///字符串转换成color
  static Color hexToColor(String color, {Color defaultColor}) {
    if (color == null || color.length != 7 ||
        int.tryParse(color.substring(1, 7), radix: 16) == null) {
      return defaultColor;
    }
    var parse = int.parse(color.substring(1, 7), radix: 16);
    var hexColor = Color(parse + 0xFF000000);
    LogUtils.d("color hex to : ${hexColor.toString()}");
    return hexColor;
  }


  ///将颜色转化为color
  static Color toColor(String color , {Color defaultColor}) {
    if (TextUtils.isEmpty(color)) {
      return defaultColor;
    }
    if (!color.contains("#")) {
      return defaultColor;
    }
    var hexColor = color.replaceAll("#", "");
    //如果是6位，前加0xff
    if (hexColor.length == 6) {
      hexColor = "0xff" + hexColor;
      var color = Color(int.parse(hexColor));
      LogUtils.d("to color 6 : ${color.toString()}");
      return color;
    }
    //如果是8位，前加0x
    if (hexColor.length == 8) {
      var color = Color(int.parse("0x$hexColor"));
      LogUtils.d("to color 8 : ${color.toString()}");
      return color;
    }
    LogUtils.d("to color : ${hexColor.toString()}");
    return defaultColor;
  }

  /// 将color颜色转变为字符串
  static String colorString(Color color){
    if(ObjectUtils.isNull(color)){
      return null;
    }
    int value = color.value;
    String radixString = value.toRadixString(16);
    String colorString = radixString.padLeft(8, '0').toUpperCase();
    return "#$colorString";
  }

  /// 检查字符串是否为十六进制
  /// Example: HexColor => #12F
  static bool isHexadecimal(String color) {
    return RegexUtils.hasMatch(color, RegexConstants.hexadecimal);
  }

}


