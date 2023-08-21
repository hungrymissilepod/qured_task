import 'package:flutter/material.dart';

class CommentsLoadingState extends StatelessWidget {
  const CommentsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
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
              'Loading comments...',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
