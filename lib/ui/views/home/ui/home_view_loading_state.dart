import 'package:flutter/material.dart';

class HomeViewLoadingState extends StatelessWidget {
  const HomeViewLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 3,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Loading posts...',
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
    );
  }
}
