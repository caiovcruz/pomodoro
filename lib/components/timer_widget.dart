import 'package:flutter/material.dart';

import 'timer_button.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Work Time',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: TimerButton(
                  text: 'Start',
                  icon: Icons.play_arrow,
                ),
              ),
              // Padding(
              // padding: EdgeInsets.only(right: 10),
              //   child: TimerButton(
              //     text: 'Stop',
              //     icon: Icons.stop,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: TimerButton(
                  text: 'Restart',
                  icon: Icons.refresh,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
