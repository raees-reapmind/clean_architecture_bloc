import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.buttonColor = Colors.blue,
    this.titleColor = Colors.white,
    this.fontSize,
    this.isApiCalling = false
  });
  final VoidCallback? onPressed;
  final String title;
  final Color? buttonColor;
  final Color? titleColor;
  final double? fontSize;
  final bool? isApiCalling;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor
      ), 
      onPressed: onPressed,
      child: isApiCalling == true
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: fontSize ?? 16,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }

}

