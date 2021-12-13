import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:yc_flutter_utils/except/flutter_error_widget.dart';
import 'package:yc_flutter_utils/log/log_utils.dart';

const bool _inProduction = const bool.fromEnvironment("dart.vm.product");
const String TAG = "handle_exception : ";

void reportError(dynamic e, StackTrace stack) {
  LogUtils.e('$TAG e---->' + e.toString());
  LogUtils.e('$TAG stack---->' + stack.toString());
}

void hookCrash(Function main) {
  ErrorWidget.builder =
      (FlutterErrorDetails errorDetails) => FlutterErrorWidget(details: errorDetails);
  if (_inProduction) {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    };
  }

  runZoned<Future<void>>(() async {
      LogUtils.d('$TAG runZoned');
      main();
      LogUtils.d('$TAG runZoned main');
    },
    onError: (dynamic error, StackTrace stack) {
      //捕获异常打印日志
      reportError(error, stack);
    },
  );
}
