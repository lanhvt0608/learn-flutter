import 'package:flutter/material.dart';
import 'package:section2/app/app.dart';
import 'package:section2/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(MyApp());
}
