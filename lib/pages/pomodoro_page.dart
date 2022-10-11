import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../components/enter_time_widget.dart';
import '../components/timer_widget.dart';
import '../store/pomodoro.store.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: TimerWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (ctx) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EnterTimeWidget(
                    title: 'Work',
                    value: store.workTime,
                    inc: store.started && store.isWorking
                        ? null
                        : store.incrementWorkTime,
                    dec: store.started && store.isWorking
                        ? null
                        : store.decrementWorkTime,
                  ),
                  EnterTimeWidget(
                    title: 'Rest',
                    value: store.restTime,
                    inc: store.started && store.isResting
                        ? null
                        : store.incrementRestTime,
                    dec: store.started && store.isResting
                        ? null
                        : store.decrementRestTime,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
