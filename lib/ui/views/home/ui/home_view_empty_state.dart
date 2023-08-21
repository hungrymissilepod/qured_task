import 'package:flutter/material.dart';
import 'package:flutter_app_template/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeViewEmptyState extends ViewModelWidget<HomeViewModel> {
  const HomeViewEmptyState({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.warning,
              color: Colors.red,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Failed to load posts',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => viewModel.fetchPosts(),
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
