// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String school;
  final String password;
  final String type;
  final String token;
  final List<dynamic> bookmarks;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.school,
    required this.password,
    required this.type,
    required this.token,
    required this.bookmarks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'school': school,
      'password': password,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      school: map['school'] as String,
      password: map['password'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
      bookmarks: List<Map<String, dynamic>>.from(
        map['bookmarks']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? school,
    String? password,
    String? type,
    String? token,
    List<dynamic>? bookmarks,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      school: school ?? this.school,
      password: password ?? this.password,
      type: type ?? this.type,
      token: token ?? this.token,
      bookmarks: bookmarks ?? this.bookmarks,
    );
  }
}
