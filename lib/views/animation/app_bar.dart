import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mov/myThemeData.dart';

class AnimatedAppBar extends StatefulWidget {
  final double end;
  const AnimatedAppBar({required this.end, super.key});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _hightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _hightAnimation = Tween<double>(
      begin: 0,
      end: widget.end,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: _hightAnimation,
      builder:
          (context, child) => AnimatedContainer(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * .05),
              color: MyThemeData.accent.withValues(alpha: .5),
            ),
            alignment: Alignment.center,
            width: screenWidth,
            height: _hightAnimation.value,
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceOut,
            child: Text(
              "MOV",
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
            ),
          ),
    );
  }
}
