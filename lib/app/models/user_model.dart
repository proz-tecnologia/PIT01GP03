import 'dart:convert';

class UserModel {
  final String? id;
  final String? name;
  final String email;
  final String? password;

  UserModel({
    this.id,
    this.name,
    required this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
