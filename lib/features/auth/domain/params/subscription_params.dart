import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubscriptionParams extends Equatable{
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String referralcode;

  const SubscriptionParams({
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.password = '',
    this.referralcode = '',
  });

  String toJson() => jsonEncode({
        'full_name': fullName,
        'email': email,
        'phone_number': phone,
        'password': password,
        'referral_code': referralcode
      });

  @override
  List<Object?> get props => [fullName, email, phone, password, referralcode];
}