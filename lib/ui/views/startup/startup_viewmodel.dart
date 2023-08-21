import 'package:flutter_app_template/services/post_service.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PostService _postService = locator<PostService>();

  Future runStartupLogic() async {
    await _postService.fetchPosts();

    _navigationService.replaceWith(Routes.homeView);
  }
}
