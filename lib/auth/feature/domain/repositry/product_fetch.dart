import 'package:e_commarce_rest_api/auth/feature/domain/entity/category_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/entity/product_entity.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class FetchProductRepositry{
  Future<Either<Failuress,List<CategoryEntity>>>fetchCategory();
  Future<Either<Failuress,List<ProductEntity>>>getProduct();
}