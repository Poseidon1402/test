import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.fullName,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['user_id'],
    fullName: json['full_name'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    phoneNumber: json['phone_number'],
    city: json['city']
  );
}