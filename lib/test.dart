import 'package:flutter/material.dart';
import 'package:section2/app/app.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
  
  updateAppState() {
    MyApp.instance.appState = 10;
  }

  getAppState() {
    print(MyApp.instance.appState);
  }
}

class _TestState extends State<Test> {
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}