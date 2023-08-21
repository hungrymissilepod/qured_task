import 'package:flutter_app_template/app/app.bottomsheets.dart';
import 'package:flutter_app_template/app/app.dialogs.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/post_model.dart';
import 'package:flutter_app_template/services/post_service.dart';
import 'package:flutter_app_template/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final PostService _postService = locator<PostService>();

  List<Post> posts = <Post>[];

  HomeViewModel() {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    posts = await runBusyFuture(_postService.fetchPosts());
  }
}
