import 'package:flutter/material.dart';

import 'pages/claculate_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '계산기',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 255, 254, 254)),
          useMaterial3: true,
        ),
        home: ClaculateScreen());
  }
}
