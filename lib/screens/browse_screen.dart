import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mov/app_theme.dart';
import 'package:mov/assets/constants/img.dart';
import 'package:mov/assets/functions.dart';
import 'package:mov/view_model/browse.dart';
import 'package:mov/animation/offset.dart';
import 'package:mov/screens/category_movies_screen.dart';
import 'package:mov/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../animation/app_bar.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BrowseVM(),
      builder: (context, child) {
        final double screenHeight = MediaQuery.of(context).size.height;
        final BrowseVM browseProvider = Provider.of(context);
        return browseProvider.isLoading
            ? Loading()
            : Padding(
              padding: EdgeInsets.only(top: .05 * screenHeight),
              child: Column(
                children: [
                  AnimatedAppBar(maxHeight: screenHeight * .1),
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      )),
                      itemBuilder: (context, index) {
                        return AnimatedOffset(
                          begin: Offset(index % 2 == 0 ? -1 : 1, 0),
                          end: Offset.zero,
                          child: MovieCategoryCard(
                            categoryName:
                                browseProvider.categories![index].name!,
                          ),
                        );
                      },
                      itemCount: browseProvider.categories!.length,
                    ),
                  ),
                ],
              ),
            );
      },
    );
  }
}

class MovieCategoryCard extends StatelessWidget {
  final String categoryName;
  const MovieCategoryCard({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        goto(context: context, screen: CategoryMoviesScreen(categoryName));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(ConstantsIMG.categoryBGpath),
            ),
          ),
          height: screenHeight * .1,
          width: screenWidth * .4,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(-7 / 360),
            child: CategoryName(name: categoryName),
          ),
        ),
      ),
    );
  }
}

class CategoryName extends StatelessWidget {
  final String name;
  const CategoryName({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: screenHeight * .06),
        SizedBox(
          width: screenWidth * .25,
          child: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              color: AppTheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
