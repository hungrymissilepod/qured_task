import 'package:flutter/material.dart';
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
                Text('Comments'),
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
