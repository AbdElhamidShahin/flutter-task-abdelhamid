import 'package:flutter_tast_abdelhamid/core/networking/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  final String image;
  final List<ProductModel> products;

  CategoryModel(this.id, this.name, this.products, this.image);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
