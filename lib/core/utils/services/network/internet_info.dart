import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetInfo {
  Future<bool> hasConnexion();
}

class InternetInfoImpl implements InternetInfo {
  final InternetConnectionChecker checker;

  const InternetInfoImpl({required this.checker});

  @override
  Future<bool> hasConnexion() => checker.hasConnection;
}