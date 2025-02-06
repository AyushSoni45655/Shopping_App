part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}
class SigninEvent extends AuthenticationEvent{
  final UserEntity userEntity;
  SigninEvent({required this.userEntity});
}
class loginEvent extends AuthenticationEvent{
  final String email;
  final String password;
  loginEvent({required this.password,required this.email});
}
class logoutEvent extends AuthenticationEvent{}
class isLoggedInEvent extends AuthenticationEvent{}
