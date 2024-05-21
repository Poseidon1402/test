import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String fullName;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String city;

  const UserEntity({
    required this.userId,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.city,
  });

  @override
  List<Object?> get props => [
        userId,
        fullName,
        firstName,
        lastName,
        phoneNumber,
        city,
      ];
}
