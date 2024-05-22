import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/utils/enum/error_type.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/params/subscription_params.dart';
import '../../domain/usecases/subscribe_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SubscribeUser subscribeUser;

  AuthenticationBloc({required this.subscribeUser}) : super(InitialState()) {
    on<SubscribeEvent>(_handleSubscriptionEvent);
  }

  void _handleSubscriptionEvent(
      SubscribeEvent event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    final result = await subscribeUser(event.newUser);

    result.fold(
      (failure) => emit(
        UnauthenticatedState(
          message: failure.message,
          type: failure.type,
        ),
      ),
      (user) => emit(AuthenticatedState(currentUser: user)),
    );
  }
}
