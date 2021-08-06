

import 'dart:convert';

import 'package:yc_flutter_utils/extens/validator_utils.dart';
import 'package:yc_flutter_utils/object/object_utils.dart';

extension ExtensionMap on Map {

  // Transform map to json
  String toJsonString() {
    return jsonEncode(this);
  }

  String getJsonPretty() {
    return JsonEncoder.withIndent('\t').convert(this);
  }

  /// Checks if data is null.
  bool isNull() => ObjectUtils.isNull(this);

  /// Checks if data is null or Blank (Empty or only contains whitespace).
  bool isNullOrBlank() => ObjectUtils.isNullOrBlank(this);

  /// Checks if length of map is LOWER than maxLength.
  bool isLengthLowerThan(int maxLength) =>
      ValidatorUtils.isLengthLowerThan(this, maxLength);

  /// Checks if length of map is LOWER OR EQUAL to maxLength.
  bool isLengthLowerOrEqual(int maxLength) =>
      ValidatorUtils.isLengthLowerOrEqual(this, maxLength);

  /// Checks if length of map is GREATER than maxLength.
  bool isLengthGreaterThan(int maxLength) =>
      ValidatorUtils.isLengthGreaterThan(this, maxLength);

  /// Checks if length of map is GREATER OR EQUAL to maxLength.
  bool isLengthGreaterOrEqual(int maxLength) =>
      ValidatorUtils.isLengthGreaterOrEqual(this, maxLength);

  /// Checks if length of map is EQUAL than maxLength.
  bool isLengthEqualTo(int maxLength) =>
      ValidatorUtils.isLengthEqualTo(this, maxLength);

  /// Checks if length of map is BETWEEN minLength to maxLength.
  bool isLengthBetween(int minLength, int maxLength) =>
      ValidatorUtils.isLengthBetween(this, minLength, maxLength);
}
