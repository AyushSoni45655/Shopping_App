import 'package:e_commarce_rest_api/auth/feature/domain/entity/category_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/product_fetch.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class CategoryUseCase{
  final FetchProductRepositry fetchProductRepositry;
  CategoryUseCase({required this.fetchProductRepositry});
  Future<Either<Failuress,List<CategoryEntity>>>call()async{
    return await fetchProductRepositry.fetchCategory();
  }
}