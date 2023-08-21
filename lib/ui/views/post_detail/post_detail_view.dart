import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/comment_model.dart';
import 'package:flutter_app_template/models/post_detail_model.dart';
import 'package:stacked/stacked.dart';

import 'post_detail_viewmodel.dart';

class PostDetailView extends StackedView<PostDetailViewModel> {
  const PostDetailView({
    Key? key,
    required this.postDetail,
  }) : super(key: key);

  final PostDetail postDetail;

  @override
  Widget builder(
    BuildContext context,
    PostDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${postDetail.post.title}',
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('image here'),
                SizedBox(height: 200),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Text('${postDetail.user.initial()}'),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        '${postDetail.user.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  '${postDetail.post.title}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${postDetail.post.body}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                Text(
                  'Comments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                viewModel.busy(PostDetailViewSection.comments)
                    ? CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: viewModel.comments.map((e) {
                          return CommentWidget(comment: e);
                        }).toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  PostDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PostDetailViewModel(postDetail);
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 12,
                child: Text(
                  '${comment.initial()}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  '${comment.email}}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            '${comment.name}}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('${comment.body}}'),
        ],
      ),
    );
  }
}
