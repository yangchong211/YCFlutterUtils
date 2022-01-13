import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


/// 去除了IntrinsicWidth限制，添加了默认蒙版
const Duration _kWindowDuration = const Duration(milliseconds: 0);
const double _kWindowCloseIntervalEnd = 2.0 / 3.0;
const double _kWindowMaxWidth = 240.0;
const double _kWindowMinWidth = 48.0;
const double _kWindowVerticalPadding = 0.0;
const double _kWindowScreenPadding = 0.0;

///弹窗方法
Future<T> showPopupWindow<T>({
  @required BuildContext context,
  RelativeRect position,
  @required Widget child,
  double elevation: 8.0,
  String semanticLabel,
  bool fullWidth,
  bool isShowBg = false,
}) {
  assert(context != null);
  String label = semanticLabel;
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
      label = semanticLabel;
      break;
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
      label = semanticLabel ?? MaterialLocalizations.of(context)?.popupMenuLabel;
  }

  return Navigator.push(context,
      new _PopupWindowRoute(
          context: context,
          position: position,
          child: child,
          elevation: elevation,
          semanticLabel: label,
          theme: Theme.of(context),
          barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
          fullWidth: fullWidth,
          isShowBg: isShowBg
      ));
}

///自定义弹窗路由：参照_PopupMenuRoute修改的
class _PopupWindowRoute<T> extends PopupRoute<T> {
  _PopupWindowRoute({
    @required BuildContext context,
    RouteSettings settings,
    this.child,
    this.position,
    this.elevation: 8.0,
    this.theme,
    this.barrierLabel,
    this.semanticLabel,
    this.fullWidth,
    this.isShowBg,
  }) : super(settings: settings) {
    assert(child != null);
  }

  final Widget child;
  final RelativeRect position;
  double elevation;
  final ThemeData theme;
  final String semanticLabel;
  final bool fullWidth;
  final bool isShowBg;

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  final String barrierLabel;

  @override
  Duration get transitionDuration => _kWindowDuration;

  @override
  Animation<double> createAnimation() {
    return new CurvedAnimation(
        parent: super.createAnimation(),
        curve: Curves.linear,
        reverseCurve: const Interval(0.0, _kWindowCloseIntervalEnd));
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Widget win = new _PopupWindow<T>(
      route: this,
      semanticLabel: semanticLabel,
      fullWidth: fullWidth,
    );
    if (theme != null) {
      win = new Theme(data: theme, child: win);
    }

    return new MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: new Builder(
        builder: (BuildContext context) {
          return Material(
            type: MaterialType.transparency,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: isShowBg ? Color(0x99000000) : null,
                child: new CustomSingleChildLayout(
                  delegate: new _PopupWindowLayoutDelegate(
                      position, null, Directionality.of(context)),
                  child: win,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

///自定义弹窗控件：对自定义的弹窗内容进行再包装，添加长宽、动画等约束条件
class _PopupWindow<T> extends StatelessWidget {
  const _PopupWindow({
    Key key,
    this.route,
    this.semanticLabel,
    this.fullWidth: false,
  }) : super(key: key);

  final _PopupWindowRoute<T> route;
  final String semanticLabel;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final double length = 10.0;
    final double unit = 1.0 / (length + 1.5);
    final CurveTween opacity = new CurveTween(curve: const Interval(0.0, 1.0 / 3.0));
    final CurveTween width = new CurveTween(curve: new Interval(0.0, unit));
    final CurveTween height = new CurveTween(curve: new Interval(0.0, unit * length));

    final Widget child = new ConstrainedBox(
        constraints: new BoxConstraints(
          minWidth: fullWidth ? double.infinity : _kWindowMinWidth,
          maxWidth: fullWidth ? double.infinity : _kWindowMaxWidth,
        ),
        child: new SingleChildScrollView(
          padding:
          const EdgeInsets.symmetric(vertical: _kWindowVerticalPadding),
          child: route.child,
        )
    );

    return new AnimatedBuilder(
      animation: route.animation,
      builder: (BuildContext context, Widget child) {
        return new Opacity(
          opacity: opacity.evaluate(route.animation),
          child: new Material(
            type: route.elevation == 0 ? MaterialType.transparency : MaterialType.card,
            elevation: route.elevation,
            child: new Align(
              alignment: AlignmentDirectional.topEnd,
              widthFactor: width.evaluate(route.animation),
              heightFactor: height.evaluate(route.animation),
              child: new Semantics(
                scopesRoute: true,
                namesRoute: true,
                explicitChildNodes: true,
                label: semanticLabel,
                child: child,
              ),
            ),
          ),
        );
      },
      child: child,
    );
  }
}

///自定义委托内容：子控件大小及其位置计算
class _PopupWindowLayoutDelegate extends SingleChildLayoutDelegate {
  _PopupWindowLayoutDelegate(
      this.position, this.selectedItemOffset, this.textDirection);

  final RelativeRect position;
  final double selectedItemOffset;
  final TextDirection textDirection;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints.loose(constraints.biggest -
        const Offset(_kWindowScreenPadding * 2.0, _kWindowScreenPadding * 2.0));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double y;
    if (selectedItemOffset == null) {
      y = position.top;
    } else {
      y = position.top +
          (size.height - position.top - position.bottom) / 2.0 -
          selectedItemOffset;
    }

    double x;
    if (position.left > position.right) {
      x = size.width - position.right - childSize.width;
    } else if (position.left < position.right) {
      x = position.left;
    } else {
      assert(textDirection != null);
      switch (textDirection) {
        case TextDirection.rtl:
          x = size.width - position.right - childSize.width;
          break;
        case TextDirection.ltr:
          x = position.left;
          break;
      }
    }

    if (x < _kWindowScreenPadding)
      x = _kWindowScreenPadding;
    else if (x + childSize.width > size.width - _kWindowScreenPadding)
      x = size.width - childSize.width - _kWindowScreenPadding;
    if (y < _kWindowScreenPadding)
      y = _kWindowScreenPadding;
    else if (y + childSize.height > size.height - _kWindowScreenPadding)
      y = size.height - childSize.height - _kWindowScreenPadding;
    return new Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupWindowLayoutDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}