import 'package:flutter/material.dart';
import 'package:mov/app_theme.dart';
import 'package:mov/text_styles.dart';
import 'package:mov/animation/offset.dart';

class AppListView<T> extends StatefulWidget {
  final String title;
  final List<T> data;
  final Widget Function(int index) builder;
  const AppListView({
    super.key,
    required this.title,
    required this.data,
    required this.builder,
  });

  @override
  State<AppListView> createState() => _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.accent.withAlpha(10), AppTheme.whiteOpacity45],
        ),
      ),
      child: Column(
        children: [
          AnimatedOffset(
            begin: Offset(0, 1),
            end: Offset.zero,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * .05),
              child: Text(
                widget.title,
                style: TextStyles.bigTitle(screenWidth),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AnimatedOffset(
                  begin: Offset(5, 2),
                  end: Offset.zero,
                  child: widget.builder(index),
                );
              },
              itemCount: widget.data.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
