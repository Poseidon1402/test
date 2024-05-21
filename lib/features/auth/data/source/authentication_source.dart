import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/config/api_config.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/services/check_status_code.dart';
import '../../domain/params/subscription_params.dart';
import '../models/user_model.dart';

abstract class AuthenticationSource {
  Future<UserModel> subscribeUser(SubscriptionParams newUser);
}

class AuthenticationSourceImpl implements AuthenticationSource {
  final http.Client client;

  AuthenticationSourceImpl({required this.client});

  @override
  Future<UserModel> subscribeUser(SubscriptionParams newUser) async {
    try {
      final response = await client.post(
        Uri.https(ApiConfig.baseRoute, '/v1/users/signup'),
        body: newUser.toJson(),
      );

      if(isSuccess(response.statusCode)) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes));
        return UserModel.fromJson(decodedJson);
      } else {
        throw ServerException();
      }
    } on http.ClientException {
      throw InternetConnectionException();
    } on SocketException {
      throw ServerException();
    }
  }
}