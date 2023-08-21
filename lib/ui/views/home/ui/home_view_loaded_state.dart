import 'package:flutter/material.dart';
import 'package:flutter_app_template/ui/views/home/home_viewmodel.dart';
import 'package:flutter_app_template/ui/views/home/ui/home_view_empty_state.dart';
import 'package:flutter_app_template/ui/views/home/ui/post_card.dart';
import 'package:stacked/stacked.dart';

class HomeViewLoadedState extends ViewModelWidget<HomeViewModel> {
  HomeViewLoadedState({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return viewModel.postDetails.isEmpty
        ? const HomeViewEmptyState()
        : Scrollbar(
            controller: controller,
            child: SingleChildScrollView(
              controller: controller,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: viewModel.postDetails.map(
                      (e) {
                        return PostCard(
                          postDetail: e,
                          onTap: () => viewModel.onPostTap(e),
                        );
                      },
                    ).toList(),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.animateTo(0, curve: Curves.bounceIn, duration: const Duration(milliseconds: 250));
                    },
                    child: const Text(
                      '↑ Scroll to top ↑',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
