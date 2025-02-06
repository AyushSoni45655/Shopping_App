part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}
class FetchCategoryEvent extends ProductEvent{}
class FetchProductEvent extends ProductEvent{}
class searchProductEvent extends ProductEvent{
  final String query;
  searchProductEvent({required this.query});
}
class sortProductEvent extends ProductEvent{
  final Sortoption sortoption;
  sortProductEvent({required this.sortoption});
}
class addWishList extends ProductEvent{
  final ProductEntity productEntity;
  addWishList({required this.productEntity});
}
class removeWishlist extends ProductEvent{
  final ProductEntity productEntity;
  removeWishlist({required this.productEntity});
}