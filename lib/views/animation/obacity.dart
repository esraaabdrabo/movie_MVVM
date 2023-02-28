import 'package:flutter/material.dart';

class AnimateOpacity extends StatefulWidget {
  final Widget child;
  final Duration duration;
  AnimateOpacity({required this.child, required this.duration, Key? key})
      : super(key: key);

  @override
  State<AnimateOpacity> createState() => _AnimatedObacityState();
}

class _AnimatedObacityState extends State<AnimateOpacity>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _obacityAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _obacityAnimation = Tween<double>(begin: -1, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuint));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _obacityAnimation,
      child: widget.child,
    );
  }
}
