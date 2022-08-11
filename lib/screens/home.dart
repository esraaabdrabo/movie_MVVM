import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/screens/browse.dart';

import 'package:movie/screens/watchList.dart';
import 'package:movie/views/HomeFragments/browse.dart';
////////////////////////////////////////////////////////

import '../views/HomeFragments/homeBody.dart';
import '../views/HomeFragments/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List pages = [HomeBody(), Search(), Browse(), watchList()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MOV',
          style: TextStyle(letterSpacing: 5, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: MyThemeData.accent,
      ),
      backgroundColor: MyThemeData.primary,
      body: selectedIndex == 0
          ? pages[0]
          : selectedIndex == 1
              ? pages[1]
              : selectedIndex == 3
                  ? pages[3]
                  : selectedIndex == 2
                      ? pages[2]
                      : Container(),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: MyThemeData.accent),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyThemeData.clicked,
          currentIndex: selectedIndex,
          onTap: (index) {
            print(selectedIndex);

            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation), label: 'BROWSE'),
            BottomNavigationBarItem(icon: Icon(Icons.save), label: 'WATCH LIST')
          ],
        ),
      ),
    );
  }
}
/*
class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late CollectionReference watchListRes;

  Future<List<movie>?>? futuerPopularList;

  Future<List<movie>?>? futuerTopRatedList;
  @override
  /*  initState() {
    super.initState();
    futuerPopularList = getPopular();

    futuerTopRatedList = getTopRated();
    watchListRes = FirebaseFirestore.instance
        .collection('watchList')
        .withConverter<movie>(
            fromFirestore: (Snapshot, _) => movie.fromJson(Snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson());
  }

 Future<List<movie>?> getPopular() async {
    return PopularSV.getMovieList(
        'https://api.themoviedb.org/3/movie/popular?api_key=36dac39aff2bc256201415d1f2d33cdf');
  }
*/
  /* Future<List<movie>?> getTopRated() async {
    return PopularSV.getMovieList(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=36dac39aff2bc256201415d1f2d33cdf');
  }
*/
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .4,
            child: ourFutureBuilder([], 'POPULAR', false),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .03,
          ),
          Container(
              height: MediaQuery.of(context).size.height * .5,
              child: ourFutureBuilder([], 'TOP RATED', true)),
          Container(
            height: MediaQuery.of(context).size.height * .03,
          ),
        ],
      ),
    );
  }
}
*/