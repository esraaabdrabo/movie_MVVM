import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mov/app_theme.dart';

import 'package:mov/widgets/home_base_view.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: HomeBaseView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
