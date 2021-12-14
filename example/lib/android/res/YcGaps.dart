import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/android/res/YcColors.dart';
import 'package:yc_flutter_utils_example/android/res/YcDimens.dart';


/// 间隔
class Gaps {
  /// 水平间隔
  static const Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static const Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static const Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static const Widget hGap16 = SizedBox(width: Dimens.gap_dp16);
  /// 垂直间隔
  static const Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static const Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static const Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static const Widget vGap50 = SizedBox(height: Dimens.gap_dp50);

  static const Widget vGap4 = SizedBox(height: 4.0);
  static const Widget vGap8 = SizedBox(height: 8.0);
  static const Widget vGap12 = SizedBox(height: 12.0);
  static const Widget vGap16 = SizedBox(height: Dimens.gap_dp16);

  static const Widget hGap4 = SizedBox(width: 4.0);
  static const Widget hGap8 = SizedBox(width: 8.0);
  static const Widget hGap12 = SizedBox(width: 12.0);

  static Widget line = Container(height: 0.6, color: YcColors.line);
  static const Widget empty = SizedBox();
}
