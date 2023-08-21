import 'package:flutter/material.dart';
import 'package:flutter_app_template/ui/views/home/home_viewmodel.dart';
import 'package:flutter_app_template/ui/views/home/ui/home_view_empty_state.dart';
import 'package:stacked/stacked.dart';

class HomeViewLoadedState extends ViewModelWidget<HomeViewModel> {
  const HomeViewLoadedState({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return viewModel.posts.isEmpty
        ? const HomeViewEmptyState()
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: viewModel.posts.map((e) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Text('${e.title}'),
                      Text('${e.body}'),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
  }
}
