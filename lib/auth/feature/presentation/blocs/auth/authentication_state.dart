part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}
class AuthLoading extends AuthenticationState {}
class AuthSuccess extends AuthenticationState {
  final UserEntity user;
  AuthSuccess(this.user);
}
class fetchUserData extends AuthenticationState{
  final UserEntity userEntity;
  fetchUserData({required this.userEntity});
}
class AuthFailure extends AuthenticationState {
  final String message;
  AuthFailure(this.message);
}
class AuthLoggedIn extends AuthenticationState {}
class AuthLoggedOut extends AuthenticationState {}