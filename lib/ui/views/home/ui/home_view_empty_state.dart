import 'package:flutter/material.dart';

class HomeViewEmptyState extends StatelessWidget {
  const HomeViewEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.warning,
              color: Colors.red,
              size: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Failed to load posts',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
