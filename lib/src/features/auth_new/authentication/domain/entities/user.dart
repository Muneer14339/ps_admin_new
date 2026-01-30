import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// domain/entities/user.dart
@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String email,
    required String firstName,
    String? location,
    required DateTime createdAt,
    @Default(0) int role,
    String? registeredFrom,
    String? currentlyLogin,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
