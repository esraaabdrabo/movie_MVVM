import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/assets/constants/img.dart';
import 'package:movie/assets/functions.dart';
import 'package:movie/view_model/browse.dart';
import 'package:movie/views/animation/offset.dart';
import 'package:movie/views/categoryMovies.dart';
import 'package:movie/widgets.dart/loading.dart';
import 'package:provider/provider.dart';
import '../../myThemeData.dart';
import '../animation/app_bar.dart';

class Browse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BrowseVM(),
        builder: (context, child) {
          double screenHeight = MediaQuery.of(context).size.height;
          BrowseVM browseProvider = Provider.of(context);
          return browseProvider.isLoading
              ? Loading()
              : Padding(
                  padding: EdgeInsets.only(top: .05 * screenHeight),
                  child: Column(
                    children: [
                      AnimatedAppBar(end: screenHeight * .1),
                      Expanded(
                          child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate:
                            (SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        )),
                        itemBuilder: (context, index) {
                          return AnimatedOffset(
                            begin:
                                index % 2 == 0 ? Offset(-1, 0) : Offset(1, 0),
                            end: Offset.zero,
                            child: Category(
                                categoryName:
                                    browseProvider.categories![index].name!),
                          );
                        },
                        itemCount: browseProvider.categories!.length,
                      )),
                    ],
                  ),
                );
        });
  }
}

class Category extends StatelessWidget {
  final String categoryName;
  Category({required this.categoryName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
        onTap: () {
          goto(context: context, screen: CategoryMovies(categoryName));
        },
        child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(ConstantsIMG.categoryBGpath))),
              height: screenHeight * .1,
              width: screenWidth * .4,
              child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-7 / 360),
                  child: CategoryName(name: categoryName)),
            )));
  }
}

class CategoryName extends StatelessWidget {
  final String name;
  CategoryName({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: screenHeight * .06,
      ),
      SizedBox(
        width: screenWidth * .25,
        child: Text(name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
                color: MyThemeData.primary,
                fontWeight: FontWeight.w600,
                fontSize: 20)),
      )
    ]);
  }
}
