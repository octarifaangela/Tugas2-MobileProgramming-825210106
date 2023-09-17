import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas2/login_screen.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
