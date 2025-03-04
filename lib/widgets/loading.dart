import 'package:flutter/material.dart';
import 'package:mov/app_theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WAIT .',
            style: TextStyle(color: Colors.white, fontSize: screenWidth * .1),
          ),
          SizedBox(height: screenHeight * .03),
          SizedBox(
            height: screenHeight * .01,
            width: screenWidth * .6,
            child: LinearProgressIndicator(color: AppTheme.golden),
          ),
        ],
      ),
    );
  }
}
