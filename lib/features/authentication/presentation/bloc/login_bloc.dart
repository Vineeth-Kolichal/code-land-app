import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginUseCase useCase;
  LoginBloc(this.useCase) : super(LoginState.initial()) {
    on<Login>(loginHandler);
  }

  Future<void> loginHandler(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
    final resp = await useCase(AuthCredential(
        userNameController.text.trim(), passwordController.text.trim()));
    final newState = resp.fold((err) {
      return state.copyWith(
          isLoading: false, error: err.error, isSuccess: false);
    }, (success) {
      userNameController.clear();
      passwordController.clear();
      return state.copyWith(isLoading: false, error: null, isSuccess: true);
    });
    emit(newState);
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
