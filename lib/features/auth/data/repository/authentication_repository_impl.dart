import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/services/network/internet_info.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/params/subscription_params.dart';
import '../../domain/repository/authentication_repository.dart';
import '../source/authentication_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationSource source;
  final InternetInfo internetInfo;

  AuthenticationRepositoryImpl({required this.source, required this.internetInfo,});

  @override
  Future<Either<Failure, UserEntity>> subscribe(SubscriptionParams newUser) async {
    try {
      if(await internetInfo.hasConnexion()) {
        final user = await source.subscribeUser(newUser);

        return Right(user);
      } else {
        return const Left(NotConnectedFailure());
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? 'Une erreur est survenue'));
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    }
  }
}