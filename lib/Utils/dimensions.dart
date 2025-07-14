import 'package:flutter/material.dart';

class Dimensions {
  static Size? size;

  static void init(BuildContext context) {
    size = MediaQuery.of(context).size;
  }
}