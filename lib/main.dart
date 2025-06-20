import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/UI/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: '/home_screens',

      routes: {
    '/home_screens': (_)=>HomeScreen(),
      },
    );
  }
}
