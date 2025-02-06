part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}
final class NavigationSelectedSttae extends NavigationState{
  final int selectedIndex;
  NavigationSelectedSttae({required this.selectedIndex});
}