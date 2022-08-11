import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/services/movieDataBase.dart';
import 'package:movie/widgets.dart/futureBuilderListView.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';
import 'package:video_player/video_player.dart';

class movieDetails extends StatefulWidget {
  movie clickedMovie;
  movieDetails(this.clickedMovie);
  static String route_name = 'movieDetails screen';
  @override
  State<movieDetails> createState() => _movieDetailsState();
}

class _movieDetailsState extends State<movieDetails> {
  late Future<List<movie>?> futureSimilartList;
  /*@override
  initState() {
    super.initState();
    futureSimilartList = getsimilar();
  }*/

  @override
  Widget build(BuildContext context) {
    late VideoPlayerController controller;

    String movieLanguage = widget.clickedMovie.originalLanguage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.primary,
        title: Text(
          ' ${widget.clickedMovie.title}'.toUpperCase(),
        ),
        centerTitle: true,
      ),
      backgroundColor: MyThemeData.primary,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                /*        FutureBuilder(
                    future: getVideo(),
                    builder: (context, AsyncSnapshot<String?> snapshot) {
                      controller =
                          VideoPlayerController.network(snapshot.data!);
                      controller.initialize().then((value) {
                        setState(() {});
                      });
                      return AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller));

                      /*Text(
                        '${snapshot.data}',
                        style: TextStyle(color: MyThemeData.text),
                      );
                   */
                    }),
      */
                Image.network(
                  'https://image.tmdb.org/t/p/original/${widget.clickedMovie.backdropPath}',
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    /////under cover title///////
                    Text(
                      '${widget.clickedMovie.title}',
                      style: TextStyle(color: MyThemeData.text),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    /////under cover date///////
                    Text(
                      '${widget.clickedMovie.releaseDate}',
                      style: TextStyle(color: MyThemeData.detText),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        noDetailsCard(widget.clickedMovie),
                        Column(
                          children: [
                            ///////////language box///////////////
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: MyThemeData.accent)),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'language : ${movieLanguage == 'es' ? 'spanish' : movieLanguage == 'en' ? 'english' : movieLanguage == 'hi' ? 'hindi' : movieLanguage == 'ar' ? 'arabic' : movieLanguage == 'fa' ? 'persian' : movieLanguage == 'fr' ? 'french' : movieLanguage} ',
                                  style: TextStyle(color: MyThemeData.detText),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            ///////over view/////////////////////
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              child: Text(
                                '${widget.clickedMovie.overview}',
                                style: TextStyle(
                                    color: MyThemeData.detText, fontSize: 10),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ////////////vote icon and number ////////////
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: MyThemeData.clicked,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      '${widget.clickedMovie.voteAverage.ceilToDouble()}',
                                      style: TextStyle(
                                          color: MyThemeData.detText,
                                          fontSize: 12))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(child: ourFutureBuilder([], 'MORE LIKE THIS', true))
              ],
            ),
          ),
          //////////cover photo///////////////

          //   ourListView('MORE LIKE THIS', true, [])
        ],
      ),
    );
  }

  /*Future<List<movie>?> getsimilar() async {
    return PopularSV.getMovieList(
        'https://api.themoviedb.org/3/movie/${widget.clickedMovie.id}/similar?api_key=36dac39aff2bc256201415d1f2d33cdf');
  }

  Future<String?> getVideo() async {
    return PopularSV.getMovieVideo(
        'https://api.themoviedb.org/3/movie/${widget.clickedMovie.id}/videos?api_key=36dac39aff2bc256201415d1f2d33cdf');
  }

*/
}
