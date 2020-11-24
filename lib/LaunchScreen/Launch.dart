import 'package:flutter/material.dart';
import 'package:medicine_reminder/env.dart';
import 'demo.dart';


class App extends StatelessWidget {

  static String _pkg = "gooey_edge";
  static String get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GooeyEdgeDemo(title: 'Gooey Edge Demo'),
    );
  }
}

