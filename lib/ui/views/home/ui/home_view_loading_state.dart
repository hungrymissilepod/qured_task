import 'package:flutter/material.dart';

class HomeViewLoadingState extends StatelessWidget {
  const HomeViewLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 20,
        ),
        Text(
          'Loading posts...',
          style: TextStyle(fontSize: 20),
        ),
      ],
    ));
  }
}
