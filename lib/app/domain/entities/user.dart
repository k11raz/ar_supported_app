class UserEntity {
  final String id;
  final String email;
  final String name;
  final String surname;
  final String? phone;
  final String? address;
  final UserRole? role;
  final DateTime createdAt;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    this.phone,
    this.address,
    this.role,
    required this.createdAt,
  });
}

enum UserRole { customer, admin }
