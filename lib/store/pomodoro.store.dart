import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pomodoro/extensions/string_extension.dart';

import '../models/notification_service.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType { work, rest }

abstract class _PomodoroStore with Store {
  @observable
  bool started = false;

  @observable
  int minutes = 1;

  @observable
  int seconds = 0;

  @observable
  int workTime = 1;

  @observable
  int restTime = 1;

  @observable
  IntervalType intervalType = IntervalType.rest;

  @observable
  Timer? timer;

  @action
  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    started = false;
    timer?.cancel();
  }

  @action
  void restart() {
    stop();
    minutes = isWorking ? workTime : restTime;
    seconds = 0;
  }

  @action
  void incrementWorkTime() {
    workTime++;

    if (isWorking) {
      restart();
    }
  }

  @action
  void decrementWorkTime() {
    if (_greaterThan(workTime, 1)) {
      workTime--;

      if (isWorking) {
        restart();
      }
    }
  }

  @action
  void incrementRestTime() {
    restTime++;

    if (isResting) {
      restart();
    }
  }

  @action
  void decrementRestTime() {
    if (_greaterThan(restTime, 1)) {
      restTime--;

      if (isResting) {
        restart();
      }
    }
  }

  bool get isWorking => intervalType == IntervalType.work;

  bool get isResting => intervalType == IntervalType.rest;

  Future<void> _changeIntervalType() async {
    if (isWorking) {
      intervalType = IntervalType.rest;
      minutes = restTime;
    } else {
      intervalType = IntervalType.work;
      minutes = workTime;
    }

    seconds = 0;

    await NotificationService.instance.showLocalNotification(
      id: 0,
      title: "${intervalType.name.capitalize()} time!",
      body: "It's time to ${intervalType.name}!",
      payload: "You ${isWorking ? 'rested well' : 'worked hard'}. Nice!",
    );
  }

  bool _greaterThan(int value, int greaterValue) {
    return value > greaterValue;
  }
}
