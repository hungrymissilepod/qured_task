import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class Comment extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment(this.postId, this.id, this.name, this.email, this.body);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  List<Object?> get props => [postId, id, name, email, body];
}
