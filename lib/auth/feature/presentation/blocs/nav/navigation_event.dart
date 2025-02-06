part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}
class NavigationIndexEvent extends NavigationEvent{
  final int index;
  NavigationIndexEvent({required this.index});
}