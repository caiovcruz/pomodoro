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
      body: SafeArea(
        child: Column(
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
                      inc: store.incrementWorkTime,
                      dec: store.decrementWorkTime,
                    ),
                    EnterTimeWidget(
                      title: 'Rest',
                      value: store.restTime,
                      inc: store.incrementRestTime,
                      dec: store.decrementRestTime,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
