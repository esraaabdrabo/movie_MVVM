import 'package:flutter/material.dart';
import 'package:mov/myThemeData.dart';
import 'package:mov/views/HomeFragments/browse.dart';
import 'package:mov/views/HomeFragments/watchList.dart';
import 'HomeFragments/homeBody.dart';
import 'HomeFragments/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final List<Widget> pages = [HomeBody(), Search(), Browse(), WatchList()];

  final List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
    BottomNavigationBarItem(icon: Icon(Icons.movie_creation), label: 'BROWSE'),
    BottomNavigationBarItem(icon: Icon(Icons.save), label: 'WATCH LIST'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.primary,
      body: pages[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyThemeData.accent),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyThemeData.golden,
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
