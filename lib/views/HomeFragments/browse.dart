import 'package:flutter/material.dart';
import 'package:movie/view_model/browse.dart';
import 'package:movie/views/categoryMovies.dart';
import 'package:movie/widgets.dart/widgets.dart';
import 'package:provider/provider.dart';
import '../../myThemeData.dart';

class Browse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
        create: (context) => BrowseVM(),
        builder: (context, child) {
          BrowseVM browseProvider = Provider.of(context);
          return browseProvider.isLoading
              ? Widgets.loading(screenHeight, screenWidth)
              : Column(
                  children: [
                    Expanded(
                        child: GridView.builder(
                      gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      )),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryMovies(
                                          browseProvider
                                              .categories![index].name!)));
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'images/backgroundCtegory.png'))),
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: RotationTransition(
                                    turns: AlwaysStoppedAnimation(-7 / 360),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .06,
                                        ),
                                        Text(
                                          browseProvider
                                              .categories![index].name!,
                                          style: TextStyle(
                                              color: MyThemeData.accent),
                                        ),
                                      ],
                                    ),
                                  ),
                                )));
                      },
                      itemCount: browseProvider.categories!.length,
                    )),
                  ],
                );
        });
  }
}
