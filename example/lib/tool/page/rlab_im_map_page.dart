import 'dart:ui';
import 'package:flutter/material.dart';


class RLabImMapPage extends StatefulWidget {
  @override
  _RLabImMapPageState createState() => _RLabImMapPageState();
}

class _RLabImMapPageState extends State<RLabImMapPage> {
  double _topHeight = 300;
  bool touchState = false;
  @override
  void initState() {
    super.initState();
    _topHeight = 300;
  }

  void onDemoEvent_(e) {
    this.touchState = true;
    this.setState(() {});
  }

  void onDemoEvent(e) {
    this.touchState = false;
    this.event(1);
  }

  void event(type) {
    Future.delayed(Duration(milliseconds: 100), () {
      if (type == 1) {
        _topHeight = _topHeight + 1;
        // MapIMService.setMapIMPadding(0, 0, _topHeight, 0);
      } else {
        _topHeight = _topHeight - 1;
        // MapIMService.setMapIMPadding(0, 0, _topHeight, 0);
      }

      if (this.touchState == false) {
        this.event(type);
      }
    });
  }

  void onDemoEvent1_(e) {
    this.touchState = true;
    this.setState(() {});
  }

  void onDemoEvent1(e) {
    this.touchState = false;
    this.event(2);
  }

  void backUserlocation() {
    //
    // MapIMService.makeMapIMCenterCoordinate();
  }

  void closePage() {
    // RNacho().closeContainer(result: '关闭IM map');
  }

  @override
  Widget build(BuildContext context) {
    var left =
        ((window.physicalSize.width / window.devicePixelRatio) / 2) - (5);
    var top = (_topHeight / 2) - 40;
    print("水滴：x" + left.toString() + "| y:" + top.toString());
    return Container(
      child: Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            child: Container(
              width: 10,
              height: 40,
              color: Colors.blue,
            ),
          ),
          Positioned(
            left: 30,
            top: 44,
            child: GestureDetector(
              onTap: closePage,
              child: Container(
                width: 100,
                height: 44,
                color: Colors.red,
                child: Text("close"),
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 44,
            child: Container(
              width: 100,
              height: 44,
              color: Colors.yellow,
              child: Text("send"),
            ),
          ),
          Positioned(
            top: _topHeight,
            child: Container(
              color: Colors.yellow,
              width: window.physicalSize.width,
              height: window.physicalSize.height - _topHeight,
              child: Stack(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTapUp: onDemoEvent_,
                        onTapDown: onDemoEvent,
                        child: Container(
                          width: 100,
                          height: 44,
                          color: Colors.white,
                          child: Text("上移动"),
                        ),
                      ),
                      GestureDetector(
                          onTapUp: onDemoEvent1_,
                          onTapDown: onDemoEvent1,
                          child: Container(
                            width: 100,
                            height: 44,
                            color: Colors.white,
                            child: Text("下移动"),
                          )),
                      GestureDetector(
                          onTap: backUserlocation,
                          child: Container(
                            width: 100,
                            height: 44,
                            color: Colors.white,
                            child: Text("归位"),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
