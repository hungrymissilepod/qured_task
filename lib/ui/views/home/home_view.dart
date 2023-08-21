import 'package:flutter/material.dart';
import 'package:flutter_app_template/ui/common/app_bar.dart';
import 'package:flutter_app_template/ui/views/home/ui/home_view_loaded_state.dart';
import 'package:flutter_app_template/ui/views/home/ui/home_view_loading_state.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'News Feed',
      ),
      body: SafeArea(
        child: viewModel.isBusy ? const HomeViewLoadingState() : HomeViewLoadedState(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
