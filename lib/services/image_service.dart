import 'dart:math';

class ImageService {
  /// We are fetching random images from this site: https://picsum.photos/images

  final Random random = Random();

  String fetchRandomImageUrl() {
    final int id = random.nextInt(80);
    return 'https://picsum.photos/id/$id/500/300';
  }
}
