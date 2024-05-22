import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.fullName,
    required super.phoneNumber,
    super.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['user_id'],
    fullName: json['full_name'],
    phoneNumber: json['phone_number'],
    city: json['city']
  );
}