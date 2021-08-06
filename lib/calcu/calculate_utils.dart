



import 'package:flutter/material.dart';

/// 计算工具类
class CalculateUtils {

  /// 计算文本高度
  static double calculateTextHeight(BuildContext context,String value,
      fontSize, FontWeight fontWeight,
      double maxWidth, int maxLines) {
    //创建painter
    TextPainter painter = TextPainter(
      locale: Localizations.localeOf(context, nullOk: true),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: value,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
    painter.layout(maxWidth: maxWidth);
    return painter.height;
  }

  /// 计算文本宽度
  static double calculateTextWidth(BuildContext context,String value,
      fontSize, FontWeight fontWeight,
      double maxWidth, int maxLines) {
    //创建painter
    TextPainter painter = TextPainter(
      locale: Localizations.localeOf(context, nullOk: true),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: value,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
    painter.layout(maxWidth: maxWidth);
    return painter.width;
  }


}