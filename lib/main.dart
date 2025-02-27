import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mov/myThemeData.dart';
import 'package:mov/views/home.dart';
import 'package:mov/view_model/watchList.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => WatchListVM(),
      builder: (context, child) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
