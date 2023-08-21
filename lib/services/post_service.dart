import 'package:dio/dio.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/post_model.dart';
import 'package:flutter_app_template/services/dio_service.dart';

class PostService {
  final DioService _dioService = locator<DioService>();

  Future<List<Post>> fetchPosts() async {
    final Response response = await _dioService.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      final List<Post> posts = <Post>[];
      final List<dynamic> data = response.data;
      for (Map<String, dynamic> obj in data) {
        final Post post = Post.fromJson(obj);
        posts.add(post);
      }
      return posts;
    }
    return <Post>[];
  }
}
