import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void showFlushBar({
    required BuildContext context,
    required Color backgroundColor,
    String? title,
    String? message,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
    FlushbarPosition position = FlushbarPosition.TOP,
    Curve animationCurve = Curves.decelerate,
    EdgeInsets margin = const EdgeInsets.all(8.0),
    EdgeInsets padding = const EdgeInsets.all(10.0),
    BorderRadius? borderRadius,
    
  }) {
    Flushbar(
      title: title,
      message: message,
      duration: duration,
      flushbarPosition: position,
      forwardAnimationCurve: animationCurve,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.white),
      margin: margin,
      padding: padding, 
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
    ).show(context);
  }
}
