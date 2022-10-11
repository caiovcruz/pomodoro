import 'package:flutter/material.dart';

import '../components/enter_time_widget.dart';
import '../components/timer_widget.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  EnterTimeWidget(
                    title: 'Work Time',
                    value: 25,
                  ),
                  EnterTimeWidget(
                    title: 'Rest Time',
                    value: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
