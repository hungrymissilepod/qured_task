import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/post_detail_model.dart';
import 'package:flutter_app_template/models/post_model.dart';
import 'package:flutter_app_template/models/user_model.dart';
import 'package:flutter_app_template/services/image_service.dart';
import 'package:flutter_app_template/services/post_service.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:random_date/random_date.dart';

class PostDetailService {
  final PostService _postService = locator<PostService>();
  final UserService _userService = locator<UserService>();
  final ImageService _imageService = locator<ImageService>();

  final List<PostDetail> postDetails = <PostDetail>[];

  Future<List<PostDetail>> fetchPostDetails() async {
    await Future.wait([
      _postService.fetchPosts(),
      _userService.fetchUsers(),
    ]);

    for (Post post in _postService.posts) {
      final User user = _userService.getUserById(post.userId);
      final PostDetail postDetail = PostDetail(post, user);

      /// Fetch a random image
      postDetail.imageUrl = _imageService.fetchRandomImageUrl();

      /// Generate a random date
      postDetail.date = RandomDate.withRange(2021, 2023).random();
      postDetails.add(postDetail);
    }

    return postDetails;
  }
}
