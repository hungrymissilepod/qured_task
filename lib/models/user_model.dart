// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String name;
  String? imageUrl;

  User(this.id, this.name, {this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String initial() {
    return name[0];
  }

  @override
  List<Object?> get props => [id, name, imageUrl];
}
