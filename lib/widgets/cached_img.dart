import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mov/app_theme.dart';

class CachedImg extends StatelessWidget {
  final String path;
  const CachedImg({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) {
        return Container(
          color: AppTheme.primary,
          child: Icon(Icons.error, color: AppTheme.mediumGray),
        );
      },
      fit: BoxFit.fill,
      progressIndicatorBuilder: (context, url, progress) {
        return Center(child: CircularProgressIndicator());
      },
      fadeInCurve: Curves.bounceIn,
      imageUrl: path,
    );
  }
}
