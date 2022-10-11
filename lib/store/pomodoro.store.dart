import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @action
  void incrementWorkTime() {
    workTime++;
  }

  @action
  void decrementWorkTime() {
    if (_greaterThan(workTime, 1)) {
      workTime--;
    }
  }

  @action
  void incrementRestTime() {
    restTime++;
  }

  @action
  void decrementRestTime() {
    if (_greaterThan(restTime, 1)) {
      restTime--;
    }
  }

  bool _greaterThan(int value, int greaterValue) {
    return value > greaterValue;
  }
}
