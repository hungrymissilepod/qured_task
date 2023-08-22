import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/comment_model.dart';
import 'package:flutter_app_template/ui/views/post_detail/comment_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommentCard -', () {
    const Comment comment = Comment(1, 1, 'name', 'email', 'body');

    testWidgets('CommentCard UI is displayed correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [CommentCard(comment: comment)],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      /// Check [CircleAvatar] UI
      final Finder avatarFinder = find.byType(CircleAvatar);
      final CircleAvatar circleAvatar = tester.firstWidget(avatarFinder);
      expect(circleAvatar.backgroundColor, Colors.black);
      expect(circleAvatar.radius, 12);

      /// Check commenters's initial in [CircleAvatar]
      final Finder avatarTextFinder = find.descendant(of: avatarFinder, matching: find.byType(Text));
      final Text avatarText = tester.firstWidget(avatarTextFinder);
      expect(avatarText.data, 'e');
      expect(avatarText.style?.fontSize, 14);
    });
  });
}
