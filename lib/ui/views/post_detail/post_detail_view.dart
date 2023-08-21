import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/post_detail_model.dart';
import 'package:flutter_app_template/ui/common/app_bar.dart';
import 'package:flutter_app_template/ui/common/post_author_avatar.dart';
import 'package:flutter_app_template/ui/views/post_detail/comment_card.dart';
import 'package:flutter_app_template/ui/views/post_detail/comments_empty_state.dart';
import 'package:flutter_app_template/ui/views/post_detail/comments_loading_state.dart';
import 'package:stacked/stacked.dart';
import 'package:transparent_image/transparent_image.dart';

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
      appBar: MyAppBar(
        title: postDetail.post.title,
        showBackArrow: true,
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: postDetail.imageUrl ?? '',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: PostAuthorAvatar(
                    user: postDetail.user,
                    date: postDetail.date ?? DateTime.now(),
                  ),
                ),
                Text(
                  postDetail.post.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  postDetail.post.body,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                const Text(
                  'Comments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                viewModel.busy(PostDetailViewSection.comments)
                    ? const CommentsLoadingState()
                    : viewModel.comments.isEmpty
                        ? const CommentsEmptyState()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: viewModel.comments.map(
                              (e) {
                                return CommentCard(comment: e);
                              },
                            ).toList(),
                          ),
                const SizedBox(height: 40),
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
