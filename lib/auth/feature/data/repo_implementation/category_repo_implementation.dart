import 'package:e_commarce_rest_api/auth/feature/data/data_source/product_data_source.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/entity/category_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/entity/product_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/repositry/product_fetch.dart';
import 'package:e_commarce_rest_api/core/failure.dart';
import 'package:fpdart/src/either.dart';

class FetchProductCategoryImple extends FetchProductRepositry{
  final ProductFetchDataSource productFetchDataSource;
  FetchProductCategoryImple({required this.productFetchDataSource});
  @override
  Future<Either<Failuress, List<CategoryEntity>>>fetchCategory()async{
    try{
      final data = await productFetchDataSource.fetchCategory();
      return Right(data);
    }
    catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, List<ProductEntity>>> getProduct()async{
try{
  final pData = await productFetchDataSource.getProduct();
  return Right(pData);
}catch(e){
  return Left(ServerFailure(e.toString()));
}
  }

}