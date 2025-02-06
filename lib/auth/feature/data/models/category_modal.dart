import 'package:e_commarce_rest_api/auth/feature/domain/entity/category_entity.dart';

class CategoryModal extends CategoryEntity {
  CategoryModal(
      {required int id,
      required String name,
      required String image,
      required String creationat,
      required String updateAt})
      : super(
            image: image,
            name: name,
            id: id,
            creationAt: creationat,
            updatedAt: updateAt);
  factory CategoryModal.fromJson(Map<String, dynamic> json) {
    return CategoryModal(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationat: json['creationAt'],
      updateAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }
}
