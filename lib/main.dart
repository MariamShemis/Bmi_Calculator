import 'package:flutter/material.dart';
import 'package:nti_flutter/screens/screen1.dart';
import 'package:nti_flutter/screens/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Screen1.routeName,
      routes: {
        Screen1.routeName: (context) => Screen1(),
        Screen2.routeName: (context) => Screen2(),
      },
    );
  }
}
