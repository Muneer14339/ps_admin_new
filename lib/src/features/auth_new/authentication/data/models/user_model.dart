import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// data/models/user_model.dart
@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String uid,
    required String email,
    required String firstName,
    String? location,
    required DateTime createdAt,
    @Default(0) int role,
    String? registeredFrom,
    String? currentlyLogin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromSignup({
    required String uid,
    required String email,
    required String firstName,
    String? location,
    required DateTime createdAt,
    String? registeredFrom,
    String? currentlyLogin,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      firstName: firstName,
      location: location,
      createdAt: createdAt,
      role: 0,
      registeredFrom: registeredFrom,
      currentlyLogin: currentlyLogin,
    );
  }

  // Convert to domain entity
  User toEntity() {
    return User(
      uid: uid,
      email: email,
      firstName: firstName,
      location: location,
      createdAt: createdAt,
      role: role,
      registeredFrom: registeredFrom,
      currentlyLogin: currentlyLogin,
    );
  }

  // Create from domain entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      firstName: user.firstName,
      location: user.location,
      createdAt: user.createdAt,
      role: user.role,
      registeredFrom: user.registeredFrom,
      currentlyLogin: user.currentlyLogin,
    );
  }
}
