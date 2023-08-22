import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/post_detail_model.dart';
import 'package:flutter_app_template/ui/common/post_author_avatar.dart';
import 'package:transparent_image/transparent_image.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.postDetail,
    required this.onTap,
  });

  final PostDetail postDetail;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: postDetail.imageUrl ?? '',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              PostAuthorAvatar(
                user: postDetail.user,
                date: postDetail.date ?? DateTime.now(),
              ),
              Text(
                postDetail.post.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      postDetail.post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 32,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
