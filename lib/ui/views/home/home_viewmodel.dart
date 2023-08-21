import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/post_model.dart';
import 'package:flutter_app_template/services/post_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final PostService _postService = locator<PostService>();

  List<Post> posts = <Post>[];

  HomeViewModel() {
    fetchPosts();
  }

  void fetchPosts() {
    posts = _postService.posts;
  }
}
