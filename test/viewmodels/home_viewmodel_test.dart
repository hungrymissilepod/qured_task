import 'package:flutter_app_template/app/app.router.dart';
import 'package:flutter_app_template/models/post_detail_model.dart';
import 'package:flutter_app_template/models/post_model.dart';
import 'package:flutter_app_template/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/ui/views/home/home_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    final PostDetail postDetail1 = PostDetail(
      const Post(
        1,
        1,
        'title 1',
        'body 1',
      ),
      User(
        1,
        'user 1',
      ),
    );

    final PostDetail postDetail2 = PostDetail(
      const Post(
        2,
        2,
        'title 2',
        'body 2',
      ),
      User(
        2,
        'user 2',
      ),
    );

    List<PostDetail> postDetails = <PostDetail>[
      postDetail1,
      postDetail2,
    ];

    test('Calling fetchPosts() will fetch a list of PostDetails', () async {
      final MockPostDetailService mockPostDetailService = getAndRegisterPostDetailService();
      final HomeViewModel viewModel = HomeViewModel();

      when(mockPostDetailService.fetchPostDetails()).thenAnswer((_) => (Future<List<PostDetail>>.value(postDetails)));

      await viewModel.fetchPosts();

      expect(viewModel.postDetails.length, 2);
      expect(viewModel.postDetails[0].post.id, 1);
      expect(viewModel.postDetails[0].post.userId, 1);
      expect(viewModel.postDetails[0].post.title, 'title 1');
      expect(viewModel.postDetails[0].post.body, 'body 1');

      expect(viewModel.postDetails[0].user.id, 1);
      expect(viewModel.postDetails[0].user.name, 'user 1');

      expect(viewModel.postDetails[1].post.id, 2);
      expect(viewModel.postDetails[1].post.userId, 2);
      expect(viewModel.postDetails[1].post.title, 'title 2');
      expect(viewModel.postDetails[1].post.body, 'body 2');

      expect(viewModel.postDetails[1].user.id, 2);
      expect(viewModel.postDetails[1].user.name, 'user 2');
    });

    test('Calling onPostTap() will navigate to PostDetailView', () async {
      final MockNavigationService mockNavigationService = getAndRegisterNavigationService();
      final HomeViewModel viewModel = HomeViewModel();

      viewModel.onPostTap(postDetail1);
      verify(mockNavigationService.navigateToPostDetailView(postDetail: postDetail1));
    });
  });
}
