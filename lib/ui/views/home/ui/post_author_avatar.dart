import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/user_model.dart';
import 'package:flutter_app_template/extensions/date_formatter.dart';
import 'package:transparent_image/transparent_image.dart';

class PostAuthorAvatar extends StatelessWidget {
  const PostAuthorAvatar({
    super.key,
    required this.user,
    required this.date,
  });

  final User user;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            // child: Text(user.initial()),
            backgroundImage: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: user.imageUrl ?? '',
            ).image,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date.postDate()),
            ],
          ),
        ],
      ),
    );
  }
}
