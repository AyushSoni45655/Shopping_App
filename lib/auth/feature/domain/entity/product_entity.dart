class ProductEntity {
  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final List<String>? images;
  final String? creationAt;
  final String? updatedAt;
  final CategoryEntitys? category;

  ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });
}

class CategoryEntitys {
  final int? id;
  final String? name;
  final String? image;
  final String? creationAt;
  final String? updatedAt;

  CategoryEntitys({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });
}
