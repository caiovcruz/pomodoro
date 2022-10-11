import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/pomodoro_page.dart';
import 'store/pomodoro.store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pomodoro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.red[500],
            secondary: Colors.green[500],
            tertiary: Colors.black,
          ),
        ),
        home: const PomodoroPage(),
      ),
    );
  }
}
