import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../store/pomodoro.store.dart';

class EnterTimeWidget extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? inc;
  final void Function()? dec;

  const EnterTimeWidget({
    Key? key,
    required this.title,
    required this.value,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (ctx) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: dec,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  primary: store.isWorking
                      ? colorScheme.primary
                      : colorScheme.secondary,
                ),
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
              Text(
                '$value min',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              ElevatedButton(
                onPressed: inc,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  primary: store.isWorking
                      ? colorScheme.primary
                      : colorScheme.secondary,
                ),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
