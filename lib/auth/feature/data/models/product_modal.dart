import '../../domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.price,
    super.description,
    super.images,
    super.creationAt,
    super.updatedAt,
    CategoryModel? super.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images']??'No Images Found'),
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
    );
  }
}

class CategoryModel extends CategoryEntitys {
  CategoryModel({
    super.id,
    super.name,
    super.image,
    super.creationAt,
    super.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
