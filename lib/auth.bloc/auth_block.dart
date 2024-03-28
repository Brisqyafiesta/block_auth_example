import 'package:block_auth_example/auth.bloc/auth_event.dart';
import 'package:block_auth_example/auth.bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 5));
      emit(AuthSuccess(name: 'Besta'));
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 5));
      emit(AuthInitial());
    });
  }
}