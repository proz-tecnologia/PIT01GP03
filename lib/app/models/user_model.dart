class UserModel {
  final int? id;
  final String? name;
  final String email;
  final String? password;

  UserModel({
    this.id,
    this.name,
    required this.email,
    this.password,
  });
}
