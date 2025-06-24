import 'package:flutter/material.dart';

class InternetChecker extends StatelessWidget { 
  final VoidCallback? onPressed;

  const InternetChecker({Key? key,   this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No Internet Connection',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Retry'),
          ),
        ],
      );
  }
}