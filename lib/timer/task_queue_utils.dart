import 'dart:async';
import 'dart:collection';

import 'package:yc_flutter_utils/log/log_utils.dart';

/// 队列task工具类
class TaskQueueUtils {
  //队列任务
  Queue<_TaskInfo> _taskList = Queue();
  //是否有正在进行的task
  _TaskInfo _currentTask;

  void addTask(Future Function() performSelector , int max) {
    //最多max个任务
    if (_taskList.length >= max) {
      //大于max个后，从头开始删除、保持队列任务是最新的。
      LogUtils.d("TripQueueUtil - 移除队列");
      _taskList.removeFirst();
    }
    _TaskInfo taskInfo = _TaskInfo(performSelector);

    /// 添加到任务队列
    LogUtils.d("TripQueueUtil - 加入队列");
    _taskList.add(taskInfo);

    /// 触发任务
    _doTask();
  }

  void cancelTasks() {
    _taskList.clear();
    _currentTask = null;
  }

  _doTask() async {
    if (_currentTask != null) return;
    if (_taskList.isEmpty) return;

    LogUtils.d("TripQueueUtil -出队列取任务");
    _currentTask = _taskList.removeFirst();

    /// 执行任务
    LogUtils.d("TripQueueUtil - 执行任务");
    await _currentTask.performSelector();
    _currentTask = null;

    /// 递归执行任务
    _doTask();
  }
}

class _TaskInfo {
  Future Function() performSelector;
  _TaskInfo(this.performSelector);
}
