import 'package:bus/app/domain/entities/user.dart';

class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String? address;
  final UserRole role;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.address,
    required this.role,
    required this.createdAt,
  });

   factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      role: parseUserRole(json['role']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
      'role': role.name,
      'created_at': createdAt.toIso8601String(),
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      phone: phone,
      address: address,
      role: role,
      createdAt: createdAt,
    );
  }

  static UserModel fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      phone: user.phone,
      address: user.address,
      role: user.role,
      createdAt: user.createdAt,
    );
  }

  static UserRole parseUserRole(String role) {
    switch (role) {
      case 'admin':
        return UserRole.admin;
      case 'customer':
      default:
        return UserRole.customer;
    }
  }
}


