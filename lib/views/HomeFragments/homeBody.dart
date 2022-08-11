import 'package:flutter/material.dart';
import 'package:movie/view_model/homeBody.dart';
import 'package:provider/provider.dart';
import '../../widgets.dart/ourListvView.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeBodyVM(),
        builder: (context, child) {
          HomeBodyVM homeProvider = Provider.of(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                //popular
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  child: ourListView('POPULAR', false, homeProvider.popular!),
                ),
                //space
                Container(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                //top rated
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  child: ourListView('TOP RATED', true, homeProvider.topRated!),
                ),
                //space
                Container(
                  height: MediaQuery.of(context).size.height * .03,
                ),
              ],
            ),
          );
          ;
        });
  }
}
