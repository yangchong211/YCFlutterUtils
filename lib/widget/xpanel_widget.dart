
import 'package:flutter/material.dart';

/// XPanel的回调监听
typedef XPanelFunction = void Function(bool isOpen);

/// 简单的XPanel，打造通用简易型的XPanel
class XPanelWidget extends StatefulWidget {

  ///头部
  final Widget headWidget;
  ///主体内容
  final Widget contentWidget;
  ///默认显示的高度
  final double initHeight;
  ///默认最高的高度
  final double totalHeight;
  ///间距
  final EdgeInsetsGeometry margin;
  ///XPanel的回调监听，主要监听打开和关闭
  final XPanelFunction xPanelFunction;

  @override
  State<StatefulWidget> createState() {
    return _XPanelState();
  }

  XPanelWidget({
    Key key,
    //头部初始化时候的内容
    @required this.headWidget,
    //主体内容
    @required this.contentWidget,
    //默认显示的高度
    @required this.initHeight,
    //默认最高的高度
    @required this.totalHeight,
    //间距
    this.margin,
    //XPanel的回调监听
    this.xPanelFunction,
  }) : super(key: key);

}

class _XPanelState extends State<XPanelWidget> with TickerProviderStateMixin{

  /// XPanel变化中的高度
  double _changeHeight = 0.0;
  /// 滚动的距离
  double _scrollPixels = 0;
  /// 是否是打开XPanel
  bool _isOpen = false;
  /// 开始时候记录y的值
  double _startY = 0;
  /// 是否在XPanel展开收起的动画过程中
  bool _inAnimation = false;
  /// 滚动控制器
  final ScrollController _scrollController = ScrollController();
  ///动画控制器
  AnimationController _animalController;
  ///动画
  Animation<double> _animation;
  ///是否是debug，如果是true，则打印日志
  bool isDebug = true;

  @override
  void initState() {
    super.initState();
    _printLog("initState");
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      //等到第一针渲染完成调用
      //动态计算padding
    });
    //XPanel最开始是默认的初始化高度
    _changeHeight = widget.initHeight;
    _animalController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getWidgetBody();
  }

  /// Header部分
  Widget _headerContent() {
    return Container(
      // color: Colors.red,
        height: widget.initHeight,
        width: MediaQuery.of(context).size.width,
        margin: widget.margin ?? EdgeInsets.only(
          left: 0,
          right: 0,
        ),
        child: widget.headWidget
    );
  }

  /// 内容部分
  Widget _getWidgetBody() {
    return Listener(
      //手指按下回调
      onPointerDown: (event) {
        //记录手指按下去y
        _startY = event.delta.dy;
        _printLog("onPointerDown event : ${event.delta}");
      },
      //手指移动回调
      onPointerMove: (evenMove) {
        _printLog("onPointerMove event : ${evenMove.delta.dy} "
            ", _inAnimation : $_inAnimation , _isOpen : $_isOpen "
            ", _scrollPixels : $_scrollPixels");
        if(evenMove.delta.dy < -5 && !_inAnimation && !_isOpen) {
          //打开panel，如果滑动距离大于20
          _printLog("onPointerMove event : open panel");
          _animationPanel(true);
        } else if(evenMove.delta.dy > 5 && !_inAnimation && _isOpen) {
          //关闭panel
          _animationPanel(false);
          _printLog("onPointerMove event : close panel");
        }
      },
      //手指抬起回调
      onPointerUp: (even) {
        _printLog("onPointerUp event : ${even.delta}");
      },
      ////触摸事件取消回调
      onPointerCancel: (event) {
        _printLog("onPointerCancel event : ${event.delta}");
      },
      child: NotificationListener(
        child: Container(
          height: _changeHeight,
          // color: Colors.brown,
          child: ListView(
            //很奇怪，解决ListView在页面中不会置顶显示问题，原理待研究
            padding: const EdgeInsets.only(top: 0),
            controller: _scrollController,
            // ClampingScrollPhysics 创建滚动物理，以防止滚动偏移量超过内容的边界。
            // NeverScrollableScrollPhysics 创建不让用户滚动的滚动物理。
            physics: _isOpen ?  ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
            // physics: NeverScrollableScrollPhysics(),
            children: [
              _headerContent(),
              widget.contentWidget,
            ],
          ),
        ),
        onNotification: (Notification notification) {
          switch (notification.runtimeType) {
          //在运行的时候
            case ScrollUpdateNotification:
              ScrollUpdateNotification scrollNotification = notification;
              _scrollPixels = scrollNotification.metrics.pixels;
              break;
          }
          return true;
        },
      ),
    );
  }

  void _animationPanel(bool open) {
    //是在动画中
    _inAnimation = true;
    //开始的位置高度
    double start = widget.initHeight;
    //结束的位置高度
    double end = widget.totalHeight;
    _printLog("_animationPanel : $open , start : $start , end : $end");
    //如果是打开
    if(!open) {
      double temp = start;
      //则开始交换
      start = end;
      end = temp;
    }

    var curve = CurvedAnimation(
      parent: _animalController,
      curve: Cubic(0.25, 0.1, 0.25, 1),
    );
    //开始到结束动画
    _animation = Tween(begin: start, end: end).animate(curve)
      ..addListener(() {
        setState(() {
          //动画过程中，不断改变高度
          //XPanel不断改变高度
          _changeHeight = _animation.value;
          _printLog("addListener _changeHeight : $_changeHeight");
        });
      });
    //添加动画监听
    _animation.addStatusListener((status) {
      //动画结束了，改变panel状态
      if (status == AnimationStatus.completed) {
        _inAnimation = false;
        setState(() {
          _isOpen = open;
        });
        //如果外部设置了监听，则处理，监听是等到动画结束了才处理
        widget?.xPanelFunction?.call(_isOpen);
        _printLog("addStatusListener completed : $_isOpen");
      }
    });

    _animalController.reset();
    _animalController.forward();
  }

  /// 打印日志
  void _printLog(String log){
    if(isDebug){
      print("XPanelWidget log : $log");
    }
  }

}


/// ListView去掉边界水波纹
class XPanelBehavior extends ScrollBehavior{

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          /// 不显示头部水波纹
          showLeading: false,
          /// 不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        break;
    }
    return child;
  }
}