import 'package:dio/dio.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/comment_model.dart';
import 'package:flutter_app_template/services/dio_service.dart';

class CommentService {
  final DioService _dioService = locator<DioService>();

  Future<List<Comment>> fetchCommentsForPost(int postId) async {
    final List<Comment> comments = <Comment>[];
    final Response response = await _dioService
        .get('https://jsonplaceholder.typicode.com/comments?postId=$postId');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      for (Map<String, dynamic> obj in data) {
        final Comment comment = Comment.fromJson(obj);
        comments.add(comment);
      }
      return comments;
    }
    return <Comment>[];
  }
}
