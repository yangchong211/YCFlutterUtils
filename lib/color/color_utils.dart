
import 'dart:ui';

///颜色工具类
class ColorUtils{

  ///字符串转换成color
  static Color hexToColor(String color, {Color defaultColor}) {
    if (color == null ||
        color.length != 7 ||
        int.tryParse(color.substring(1, 7), radix: 16) == null) {
      return defaultColor;
    }
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }


  ///将颜色转化为color
  Color toColor(String color , {Color defaultColor}) {
    if (color == null || color.length == 0) {
      return defaultColor;
    }
    if (!color.contains("#")) {
      return defaultColor;
    }
    var hexColor = color.replaceAll("#", "");
    //如果是6位，前加0xff
    if (hexColor.length == 6) {
      hexColor = "0xff" + hexColor;
      return Color(int.parse(hexColor));
    }
    //如果是8位，前加0x
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return defaultColor;
  }

}


