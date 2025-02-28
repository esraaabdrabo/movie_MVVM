import 'package:flutter/material.dart';

class AnimatedOffset extends StatefulWidget {
  final Offset begin;
  final Offset end;
  final Widget child;

  const AnimatedOffset({
    required this.child,
    required this.begin,
    required this.end,
    super.key,
  });

  @override
  State<AnimatedOffset> createState() => _AnimatedOffsetState();
}

class _AnimatedOffsetState extends State<AnimatedOffset>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _offsetAnimation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _offsetAnimation, child: widget.child);
  }
}
