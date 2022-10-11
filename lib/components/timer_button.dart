import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const TimerButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: colorScheme.tertiary,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: 35,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
