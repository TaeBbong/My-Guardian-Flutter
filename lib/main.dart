import 'package:flutter/material.dart';
import 'package:my_guardian/screen_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter layout demo', home: MainScreen());
  }
}
