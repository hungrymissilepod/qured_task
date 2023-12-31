import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object?> get props => [userId, id, title, body];
}
