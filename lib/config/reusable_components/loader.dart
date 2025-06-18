import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatefulWidget{
  final double size;
  final Color color;
  const LoaderWidget({super.key, this.size = 60, this.color = Colors.green});

  @override
  State<LoaderWidget> createState() => _LoaderWidgerState(); 

}

class _LoaderWidgerState extends State<LoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Center(
        child:
        Platform.isAndroid ? 
            CircularProgressIndicator(
            color: widget.color,
          )
        :
            CupertinoActivityIndicator(
            color: widget.color,
          )
      ),
    );
  }
}