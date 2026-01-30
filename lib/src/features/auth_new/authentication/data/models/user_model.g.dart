// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      location: json['location'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      role: (json['role'] as num?)?.toInt() ?? 0,
      registeredFrom: json['registeredFrom'] as String?,
      currentlyLogin: json['currentlyLogin'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'firstName': instance.firstName,
      'location': instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'role': instance.role,
      'registeredFrom': instance.registeredFrom,
      'currentlyLogin': instance.currentlyLogin,
    };
