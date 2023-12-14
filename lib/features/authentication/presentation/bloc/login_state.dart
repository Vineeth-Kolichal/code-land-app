part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {required bool isLoading,
      required String? error,
      required bool isSuccess}) = _Initial;
  factory LoginState.initial() =>
      const LoginState(isLoading: false, error: null, isSuccess: false);
}
