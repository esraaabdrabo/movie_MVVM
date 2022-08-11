import 'package:flutter/material.dart';

import 'package:movie/dataModel/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/screens/movieDetails.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class noDetailsCard extends StatefulWidget {
  bool? needpadding = true; //false in details card call
  movie Movie;
  // int id;
  // String imgPath;
  noDetailsCard(this.Movie, [this.needpadding = true]);
  @override
  _noDetailsCardState createState() => _noDetailsCardState();
}

class _noDetailsCardState extends State<noDetailsCard> {
  late CollectionReference watchListRes;
  var clicked = false;
  @override
  void initState() {
    super.initState();
    watchListRes = FirebaseFirestore.instance
        .collection('watchList')
        .withConverter<movie>(
            fromFirestore: (Snapshot, _) => movie.fromJson(Snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => movieDetails(
                      widget.Movie,
                    )))
      },
      child: Padding(
        padding: widget.needpadding!
            ? EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .05,
                left: MediaQuery.of(context).size.width * .05,
                bottom: MediaQuery.of(context).size.width * .1)
            : EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: (!widget.needpadding!
                ? BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))
                : BorderRadius.circular(5)),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: widget.Movie.posterPath != ''
                    ? NetworkImage(
                        'https://image.tmdb.org/t/p/w185/${widget.Movie.posterPath}')
                    : NetworkImage(
                        'https://image.tmdb.org/t/p/w185/${widget.Movie.posterPath}')

                /*             NetworkImage(
                        'https://www.bing.com/images/search?view=detailV2&ccid=znzcgcsF&id=4A266FB55F48059C6C957CB38A2FB91B5882A88B&thid=OIP.znzcgcsFVgefF5C6RNgNywHaHa&mediaurl=https%3a%2f%2fmedia.istockphoto.com%2fvectors%2ferror-icon-vector-illustration-vector-id922024224%3fk%3d6%26m%3d922024224%26s%3d612x612%26w%3d0%26h%3dLXl8Ul7bria6auAXKIjlvb6hRHkAodTqyqBeA6K7R54%3d&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.ce7cdc81cb0556079f1790ba44d80dcb%3frik%3di6iCWBu5L4qzfA%26pid%3dImgRaw%26r%3d0&exph=612&expw=612&q=notfound+vector&simid=608045272079950836&FORM=IRPRST&ck=4E5F1FCAB9E85DAA82A0C6B76ADE23F9&selectedIndex=2&ajaxhist=0&ajaxserp=0')),
      */
                ),
          ),
          height: MediaQuery.of(context).size.height * .25,
          width: MediaQuery.of(context).size.width * .4,
          alignment: Alignment.topLeft,

          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color:
                          !clicked ? MyThemeData.detText : MyThemeData.clicked,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(5))),
                  padding: EdgeInsets.all(3),
                  ///////////add//////////////////////
                  child: IconButton(
                    icon: Icon(
                      !clicked ? Icons.add : Icons.check,
                      size: 35,
                      color: MyThemeData.text,
                    ),
                    onPressed: () {
                      watchListRes
                          .doc('${widget.Movie.id}')
                          .set(widget.Movie)
                          .then((value) => print("User Added"))
                          .catchError(
                              (error) => print("Failed to add movie: $error"));

                      if (clicked)
                        clicked = false;
                      else
                        clicked = true;
                      setState(() {});
                    },
                  ))
            ],
          ),

          // Image.asset('assets/images/doraTest.jfif')
        ),
      ),
    );
  }
}
