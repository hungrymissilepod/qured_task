import 'package:flutter/material.dart';

class CommentsEmptyState extends StatelessWidget {
  const CommentsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'No comments',
      style: TextStyle(fontSize: 16),
    );
  }
}
