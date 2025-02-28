import 'package:flutter/material.dart';
import 'package:mov/app_theme.dart';

import 'package:mov/screens/browse_screen.dart';
import 'package:mov/screens/watch_list_screen.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';

class HomeBaseView extends StatefulWidget {
  const HomeBaseView({super.key});

  @override
  HomeBaseViewState createState() => HomeBaseViewState();
}

class HomeBaseViewState extends State<HomeBaseView> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen(),
  ];

  final List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
    BottomNavigationBarItem(icon: Icon(Icons.movie_creation), label: 'BROWSE'),
    BottomNavigationBarItem(icon: Icon(Icons.save), label: 'WATCH LIST'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: pages[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppTheme.accent),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.golden,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() => selectedIndex = index);
          },
          items: navItems,
        ),
      ),
    );
  }
}
