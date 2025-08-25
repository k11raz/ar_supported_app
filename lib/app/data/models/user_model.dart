import 'package:bus/app/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String email;
  final String name;
  final String surname;
  final String? phone;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    this.phone,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      surname: json['surname'],
      phone: json['phone'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'surname': surname,
      'phone': phone!,
      'created_at': createdAt.toIso8601String(),
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      surname: surname,
      phone: phone,
      createdAt: createdAt,
    );
  }

  static UserModel fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      surname: user.surname,
      phone: user.phone,
      createdAt: user.createdAt,
    );
  }

  // static UserRole parseUserRole(String role) {
  //   switch (role) {
  //     case 'admin':
  //       return UserRole.admin;
  //     case 'customer':
  //     default:
  //       return UserRole.customer;
  //   }
  // }
}
