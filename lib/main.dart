import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/screens/home.dart';
import 'package:movie/screens/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.theme,
      home: Home(),
    );
  }
}
