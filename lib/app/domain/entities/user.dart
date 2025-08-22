import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String surname;
  final String? phone;
  final String? address;
  final UserRole? role;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    this.phone,
    this.address,
    this.role,
    required this.createdAt,
  });

  @override
  List<Object> get props => [id,createdAt, name, surname, email];
}

enum UserRole { customer, admin }
