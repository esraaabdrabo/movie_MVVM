import 'package:flutter/material.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/views/HomeFragments/browse.dart';
import 'package:movie/views/watchList.dart';
import 'HomeFragments/homeBody.dart';
import 'HomeFragments/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List pages = [HomeBody(), Search(), Browse(), WatchList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: MyThemeData.primary,
        body: getScreen(),
        bottomNavigationBar: navTheme());
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'MOV',
        style: TextStyle(letterSpacing: 1, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: MyThemeData.accent,
    );
  }

  getScreen() {
    return selectedIndex == 0
        ? pages[0]
        : selectedIndex == 1
            ? pages[1]
            : selectedIndex == 3
                ? pages[3]
                : selectedIndex == 2
                    ? pages[2]
                    : Container();
  }

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
    BottomNavigationBarItem(icon: Icon(Icons.movie_creation), label: 'BROWSE'),
    BottomNavigationBarItem(icon: Icon(Icons.save), label: 'WATCH LIST')
  ];

  Theme navTheme() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: MyThemeData.accent),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyThemeData.clicked,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: navItems),
    );
  }
}
