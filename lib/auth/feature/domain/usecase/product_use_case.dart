import 'package:e_commarce_rest_api/auth/feature/domain/entity/product_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/product_fetch.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class ProductUseCase{
  final FetchProductRepositry fetchProductRepositry;
  ProductUseCase({required this.fetchProductRepositry});
  Future<Either<Failuress,List<ProductEntity>>>call()async{
    return await fetchProductRepositry.getProduct();
  }
}