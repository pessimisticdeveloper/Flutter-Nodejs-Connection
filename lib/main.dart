import 'package:flutter/material.dart';
import 'package:flutter_nodejs/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter node.js App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeScreen()
    );
  }
}

