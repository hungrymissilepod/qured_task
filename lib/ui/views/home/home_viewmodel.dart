import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/post_detail_model.dart';
import 'package:flutter_app_template/services/post_detail_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final PostDetailService _postDetailService = locator<PostDetailService>();

  List<PostDetail> postDetails = <PostDetail>[];

  HomeViewModel() {
    fetchPosts();
  }

  void fetchPosts() async {
    postDetails = await runBusyFuture(_postDetailService.fetchPostDetails());
  }
}
