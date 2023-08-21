import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/comment_model.dart';
import 'package:flutter_app_template/models/post_detail_model.dart';
import 'package:flutter_app_template/services/comment_service.dart';
import 'package:stacked/stacked.dart';

enum PostDetailViewSection { comments }

class PostDetailViewModel extends BaseViewModel {
  final CommentService _commentService = locator<CommentService>();

  final PostDetail postDetail;

  List<Comment> comments = <Comment>[];

  PostDetailViewModel(this.postDetail) {
    fetchComments(postDetail.post.id);
  }

  Future<void> fetchComments(int postId) async {
    comments = await runBusyFuture(
      _commentService.fetchCommentsForPost(postId),
      busyObject: PostDetailViewSection.comments,
    );
  }
}
