import 'dart:convert';

import 'package:e_commarce_rest_api/auth/feature/data/models/category_modal.dart';
import 'package:e_commarce_rest_api/auth/feature/data/models/product_modal.dart';
import 'package:e_commarce_rest_api/core/utils/api_handler_statuscode.dart';
import 'package:http/http.dart' as http;
import 'package:fpdart/fpdart.dart';

abstract class ProductFetchDataSource {
  Future<List<CategoryModal>> fetchCategory();
  Future<List<ProductModel>> getProduct();
}

class productFetchDataSourceImple extends ProductFetchDataSource {
  final http.Client client;
  productFetchDataSourceImple({required this.client});
  @override
  Future<List<CategoryModal>> fetchCategory() async {
    final url = Uri.parse("https://api.escuelajs.co/api/v1/categories");
    final responce = await client.get(url);
    handleResponseStatusCode(responce.statusCode);
    final List<dynamic> data = jsonDecode(responce.body);
    return data
        .map(
          (e) => CategoryModal.fromJson(e),
        )
        .toList();
  }

  @override
  Future<List<ProductModel>> getProduct() async {
    final url = Uri.parse("https://api.escuelajs.co/api/v1/products");
    final reponse = await client.get(url);
    handleResponseStatusCode(reponse.statusCode);
    final List<dynamic> data = jsonDecode(reponse.body);
    return data
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();
  }
}
