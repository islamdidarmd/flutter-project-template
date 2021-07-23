part of models;

@JsonSerializable()
class AppUser {
  String name;
  String? email;
  String? picture;

  AppUser({
    required this.name,
    this.email,
    this.picture,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
