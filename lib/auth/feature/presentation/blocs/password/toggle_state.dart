part of 'toggle_bloc.dart';

@immutable
sealed class ToggleState {}

final class ToggleInitial extends ToggleState {}
final class TogglePassowrdSTtae extends ToggleState{
  final bool isObscure;
  TogglePassowrdSTtae({required this.isObscure});
}