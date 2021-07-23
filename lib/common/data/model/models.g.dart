// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return AppUser(
    name: json['name'] as String,
    email: json['email'] as String?,
    picture: json['picture'] as String?,
  );
}

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'picture': instance.picture,
    };
