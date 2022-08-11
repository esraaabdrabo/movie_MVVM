import 'package:flutter/material.dart';
import 'package:movie/view_model/browse.dart';
import 'package:provider/provider.dart';

import '../../myThemeData.dart';
import '../../screens/moviesCategory.dart';

class Browse extends StatelessWidget {
  const Browse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BrowseVM(),
        builder: (context, child) {
          BrowseVM browseProvider = Provider.of(context);
          return Column(
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
                                builder: (context) => moviesCategory(
                                    browseProvider.categories![index].name!)));
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
                                    browseProvider.categories![index].name!,
                                    style: TextStyle(color: MyThemeData.accent),
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
