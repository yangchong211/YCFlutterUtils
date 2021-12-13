

import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';

const String TAG = "handle_exception : ";


class FlutterErrorWidget extends StatelessWidget{

  final FlutterErrorDetails details;

  FlutterErrorWidget({
    Key key,
    this.details,
  })  : assert(details != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _errorWidgetBuilder(details);
  }

}

/// 创建自定义ErrorWidget对象
Widget _errorWidgetBuilder(FlutterErrorDetails details) {
  LogUtils.e('$TAG _errorWidgetBuilder '+ _stringify(details.exception)
      + _stringify(details.stack));
  String message = '';
  if (true) {
    message = _stringify(details.exception) +
        '\nSee also: https://flutter.dev/docs/testing/errors';
  }
  final Object exception = details.exception;
  return ErrorWidget.withDetails(
      message: message, error: exception is FlutterError ? exception : null);
}


String _stringify(Object exception) {
  try {
    return exception.toString();
  } catch (e) {
    // intentionally left empty.
  }
  return 'Error';
}
