// ignore_for_file: must_be_immutable

import 'package:flutter_app_template/models/comment_model.dart';
import 'package:flutter_app_template/models/post_model.dart';
import 'package:flutter_app_template/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'post_detail_model.g.dart';

@JsonSerializable()
class PostDetail extends Equatable {
  final Post post;
  final User user;
  final List<Comment>? comments;
  String? imageUrl;
  DateTime? date;

  PostDetail(
    this.post,
    this.user, {
    this.comments,
    this.imageUrl,
    this.date,
  });

  factory PostDetail.fromJson(Map<String, dynamic> json) => _$PostDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PostDetailToJson(this);

  @override
  List<Object?> get props => [post, user, comments, imageUrl];
}
