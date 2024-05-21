import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/user_entity.dart';
import '../params/subscription_params.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> subscribe(SubscriptionParams newUser);
}