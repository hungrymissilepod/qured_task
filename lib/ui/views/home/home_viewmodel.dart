import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/app/app.router.dart';
import 'package:flutter_app_template/models/post_detail_model.dart';
import 'package:flutter_app_template/services/post_detail_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final PostDetailService _postDetailService = locator<PostDetailService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<PostDetail> postDetails = <PostDetail>[];

  HomeViewModel() {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    postDetails = await runBusyFuture(_postDetailService.fetchPostDetails());
  }

  void onPostTap(PostDetail postDetail) {
    _navigationService.navigateToPostDetailView(postDetail: postDetail);
  }
}
