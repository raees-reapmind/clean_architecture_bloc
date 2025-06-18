import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.buttonColor = Colors.blue,
    this.titleColor = Colors.white,
    this.fontSize,
  });
  final VoidCallback? onPressed;
  final String title;
  final Color? buttonColor;
  final Color? titleColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor
      ), 
      onPressed: onPressed, 
      child: Text(
        title,
        style: TextStyle(color: titleColor,fontSize: fontSize),
      ));
  }

}

