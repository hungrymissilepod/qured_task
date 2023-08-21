import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/user_model.dart';
import 'package:flutter_app_template/services/dio_service.dart';

class UserService {
  final DioService _dioService = locator<DioService>();
  final Random _random = Random();

  final List<User> users = <User>[];

  Future<List<User>> fetchUsers() async {
    final Response response = await _dioService.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      for (Map<String, dynamic> obj in data) {
        final User user = User.fromJson(obj);
        user.imageUrl = _getRandomImageUrl();
        users.add(user);
      }
      return users;
    }
    return <User>[];
  }

  String _getRandomImageUrl() {
    final bool male = _random.nextBool();
    final int r = _random.nextInt(10);
    if (male) {
      return 'https://xsgames.co/randomusers/assets/avatars/male/$r.jpg';
    }
    return 'https://xsgames.co/randomusers/assets/avatars/female/$r.jpg';
  }

  User getUserById(int id) {
    return users.firstWhere((e) => e.id == id);
  }
}
