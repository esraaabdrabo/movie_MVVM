import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/views/home.dart';
import 'package:movie/view_model/watchList.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => WatchListVM(),
      builder: (context, child) {
        return MyApp();
      }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.theme,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
