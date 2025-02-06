part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState{}
final class ProductLoaded extends ProductState{
  final List<ProductEntity>wishlist;
  final List<ProductEntity>product;
  ProductLoaded({required this.product,required this.wishlist});
}
final class CategoryLoaded extends ProductState{
  final List<CategoryEntity>category;
  CategoryLoaded({required this.category});
}
final class ProductError extends ProductState{
  final String error;
  ProductError({required this.error});
}