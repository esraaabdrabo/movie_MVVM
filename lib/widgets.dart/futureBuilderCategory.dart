import 'package:flutter/material.dart';

import 'package:movie/dataModel/category.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/screens/moviesCategory.dart';

class futureBuilderCategory extends StatefulWidget {
  Future<List<category>?> futureCategoryList;
  futureBuilderCategory(this.futureCategoryList);
  @override
  State<futureBuilderCategory> createState() => _futureBuilderCategoryState();
}

class _futureBuilderCategoryState extends State<futureBuilderCategory> {
  List<category>? categoryList;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.futureCategoryList,
        builder:
            (BuildContext context, AsyncSnapshot<List<category>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('error ${snapshot.connectionState}');
            } else if (snapshot.hasData) {
              print('has data');
              categoryList = snapshot.data!;
              return GridView.builder(
                gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                )),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => moviesCategory(
                                    '${categoryList![index].name}')));
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Container(
                            //alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'images/backgroundCtegory.png'))),
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .4,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-7 / 360),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .06,
                                  ),
                                  Text(
                                    '${categoryList![index].name}',
                                    style: TextStyle(color: MyThemeData.accent),
                                  ),
                                ],
                              ),
                            ),
                          )));
                },
                itemCount: categoryList!.length,
              );
            }
          }
          return Text('${futureBuilderCategory}');
        });
  }
}
