part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscribeEvent extends AuthenticationEvent {
  final SubscriptionParams newUser;

  SubscribeEvent({required this.newUser});

  @override
  List<Object?> get props => [newUser];
}