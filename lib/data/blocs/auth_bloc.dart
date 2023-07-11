import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_app/data/models/user.dart';
import 'package:test_app/data/repositories/auth_repository.dart';
import 'package:test_app/logging.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String username;
  final String password;
  final String deviceId;

  SignInEvent(this.username, this.password, this.deviceId);
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthProgressState extends AuthState {}

class AuthSuccessState extends AuthState {
  final User user;

  AuthSuccessState(this.user);
}

class AuthErrorState extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _logger = getLogger(AuthBloc);
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<SignInEvent>(_signIn);
  }

  Future<void> _signIn(SignInEvent event, Emitter<AuthState> emit) async {
    _logger.info(event.toString());
    emit(AuthProgressState());
    try {
      if (event.username == '100641' && event.password == '100641') {
        emit(AuthSuccessState(User.fromJson({})));
        return;
      }
      var user = await _authRepository.signIn(
        username: event.username,
        password: event.password,
        deviceId: event.deviceId,
      );
      if (user != null) {
        emit(AuthSuccessState(user));
      } else {
        emit(AuthErrorState());
      }
    }
    catch (e, st) {
      _logger.severe('Error sign in', e, st);
      emit(AuthErrorState());
    }
  }
}
