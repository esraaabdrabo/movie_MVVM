import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../myThemeData.dart';

class CachedImg extends StatelessWidget {
  final String path;
  CachedImg({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) => Container(
        color: MyThemeData.primary,
        child: Icon(
          Icons.error,
          color: MyThemeData.mediumGray,
        ),
      ),
      fit: BoxFit.fill,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(),
      ),
      fadeInCurve: Curves.bounceIn,
      imageUrl: path,
    );
  }
}
