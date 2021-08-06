


import 'dart:convert';

import 'package:yc_flutter_utils/extens/transform_utils.dart';
import 'package:yc_flutter_utils/extens/validator_utils.dart';
import 'package:yc_flutter_utils/object/object_utils.dart';

extension ExtensionList on List {

  /// Transform list to json
  String toJsonString() {
    return jsonEncode(this);
  }

  ///
  String getJsonPretty() {
    return JsonEncoder.withIndent('\t').convert(this);
  }

  /// Get total value of list of num (int/double)
  /// Example: [1,2,3,4] => 10
  num valueTotal() {
    num total = 0;
    if (this == null || this.isEmpty) return total;
    if (this[0] is num) for (var v in this) total += v;
    throw FormatException('Can only accepting list of num (int/double)');
  }

  /// Checks if data is null.
  bool isNull() => ObjectUtils.isNull(this);

  /// Checks if data is null or Blank (Empty or only contains whitespace).
  bool isNullOrBlank() => ObjectUtils.isNullOrBlank(this);

  /// Checks if int value is Palindrom.
  bool isPalindrom() =>
      ValidatorUtils.isPalindrome(TransformUtils.numericOnly(this.toString()));

  /// Checks if all value inside list are same.
  /// Example: [1,1,1,1] -> true
  bool isOneAKind() => ValidatorUtils.isOneAKind(this);

  /// Checks if length of list is LOWER than maxLength.
  bool isLengthLowerThan(int maxLength) =>
      ValidatorUtils.isLengthLowerThan(this, maxLength);

  /// Checks if length of list is LOWER OR EQUAL to maxLength.
  bool isLengthLowerOrEqual(int maxLength) =>
      ValidatorUtils.isLengthLowerOrEqual(this, maxLength);

  /// Checks if length of list is GREATER than maxLength.
  bool isLengthGreaterThan(int maxLength) =>
      ValidatorUtils.isLengthGreaterThan(this, maxLength);

  /// Checks if length of list is GREATER OR EQUAL to maxLength.
  bool isLengthGreaterOrEqual(int maxLength) =>
      ValidatorUtils.isLengthGreaterOrEqual(this, maxLength);

  /// Checks if length of list is EQUAL than maxLength.
  bool isLengthEqualTo(int maxLength) =>
      ValidatorUtils.isLengthEqualTo(this, maxLength);

  /// Checks if length of list is BETWEEN minLength to maxLength.
  bool isLengthBetween(int minLength, int maxLength) =>
      ValidatorUtils.isLengthBetween(this, minLength, maxLength);

}
