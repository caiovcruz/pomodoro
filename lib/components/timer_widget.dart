import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../store/pomodoro.store.dart';
import 'timer_button.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (ctx) => Container(
        color: store.isWorking ? colorScheme.primary : colorScheme.secondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              store.isWorking ? 'Work Time!' : 'Rest Time!',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 120,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.started)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TimerButton(
                      text: 'Start',
                      icon: Icons.play_arrow,
                      onPressed: store.start,
                    ),
                  ),
                if (store.started)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TimerButton(
                      text: 'Stop',
                      icon: Icons.stop,
                      onPressed: store.stop,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TimerButton(
                    text: 'Restart',
                    icon: Icons.refresh,
                    onPressed: store.restart,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
