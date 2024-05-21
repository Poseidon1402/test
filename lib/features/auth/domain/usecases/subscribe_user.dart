import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/user_entity.dart';
import '../params/subscription_params.dart';
import '../repository/authentication_repository.dart';

abstract class SubscribeUser {
  Future<Either<Failure, UserEntity>> call(SubscriptionParams newUser);
}

class SubscribeUserImpl implements SubscribeUser {
  final AuthenticationRepository repository;

  SubscribeUserImpl({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(SubscriptionParams newUser) async {
    return repository.subscribe(newUser);
  }
}