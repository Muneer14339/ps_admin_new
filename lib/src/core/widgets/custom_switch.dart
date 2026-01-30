import 'dart:developer';

import 'package:flutter/material.dart';

import '../theme/theme_data/theme_data.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
   bool disable;
  final Color? enableColor;
  final Color? disableColor;
  final double? width;
  final double? height;
  final double? switchHeight;
  final double? switchWidth;
  final BoxBorder? border;
  final ValueChanged<bool> onChanged;
  final double? radius;

   CustomSwitch(
      {super.key,
      required this.value,
      this.enableColor,
      this.disableColor,
      this.width,
      this.height,
      this.switchHeight,
      this.switchWidth,
      required this.onChanged,
      this.radius,
      this.border,  this.disable = false});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  // @override
  // void initState() {
  //   super.initState();
  //   _animationController = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 60));

  //   // Initialize the animation based on the initial value
  //   _circleAnimation = AlignmentTween(
  //           begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
  //           end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
  //       .animate(CurvedAnimation(
  //           parent: _animationController, curve: Curves.linear));

  //   // Set the initial position of the animation
  //   if (widget.value) {
  //     _animationController.forward();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));

    _circleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
    _animationController.value = widget.value ? 1.0 : 0.0;
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: widget.disable? null :() {
            if (_animationController.isCompleted) {
              log('didUpdateWidget true');
              widget.onChanged(false);
              _animationController.reverse();
            } else {
              log('didUpdateWidget false');
              widget.onChanged(true);
              _animationController.forward();
            }
          },
          child: Container(
            width: widget.width ?? 38.0,
            height: widget.height ?? 18.0,
            padding: widget.radius != null
                ? const EdgeInsets.only(
                    top: 0.5, bottom: 0.5, right: 0, left: 0)
                : const EdgeInsets.only(
                    top: 0.5, bottom: 0.5, right: 0.5, left: 0.5),
            decoration: BoxDecoration(
              border: widget.border,
              borderRadius: BorderRadius.circular(widget.radius ?? 20.0),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? widget.disableColor
                  : widget.enableColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.1),
              child: Container(
                alignment: _circleAnimation.value,
                child: Container(
                  width: widget.switchWidth ?? 18.0,
                  height: widget.switchHeight ?? 18.0,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.textPrimary(context),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
