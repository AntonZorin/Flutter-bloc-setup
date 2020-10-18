


import 'package:flutter/foundation.dart';

class UserEntity  {
	 int id;
	String name;
	String username;
	String email;
	String phone;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  UserEntity({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.email,
    @required this.phone,
  });

  UserEntity copyWith({
    int id,
    String name,
    String username,
    String email,
    String phone,
  }) {
    return new UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, username: $username, email: $email, phone: $phone}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          email == other.email &&
          phone == other.phone);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      phone.hashCode;

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return new UserEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'username': this.username,
      'email': this.email,
      'phone': this.phone,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
