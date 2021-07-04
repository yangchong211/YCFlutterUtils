


import 'package:yc_flutter_plugin/bus/event_bus.dart';

typedef void EventCallback(arg);

/// 消息结构体
class EventMessage {

  final String eventName;

  final dynamic arguments;

  EventMessage(this.eventName, {this.arguments});

}

/// 消息通知服务
class EventBusService {

  factory EventBusService() => _getInstance();

  static EventBusService get instance => _getInstance();

  static EventBusService _instance;

  EventBusService._internal();

  static EventBusService _getInstance() {
    if (_instance == null) {
      _instance = EventBusService._internal();
    }
    return _instance;
  }

  EventBus _eBus = EventBus();

  EventBus get eventBus {
    return _eBus;
  }
}
