import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie/myThemeData.dart';

class AnimatedAppBar extends StatefulWidget {
  double end;
  AnimatedAppBar({required this.end, Key? key}) : super(key: key);

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _hightAnimation;
  late Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _hightAnimation = Tween<double>(begin: 0, end: widget.end).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _colorAnimation = Tween<Color>(
            begin: MyThemeData.accent, end: MyThemeData.clicked)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
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
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: _hightAnimation,
        builder: (context, child) => AnimatedContainer(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * .05),
                  color: MyThemeData.accent.withOpacity(.5),
                  boxShadow: []),
              alignment: Alignment.center,
              width: screenWidth,
              height: _hightAnimation.value,
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceOut,
              child: Text("MOV",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      
                        letterSpacing: 1, color: Colors.white, fontSize: 23),
                  )),
            ));
  }
}
