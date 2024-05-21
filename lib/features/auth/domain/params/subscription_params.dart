class SubscriptionParams {
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

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'email': email,
    'phone_number': phone,
    'password': password,
    'referral_code': referralcode
  };
}