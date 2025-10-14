import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final String image;
  final int price;
  @JsonKey(name: 'old_price')
  final int oldPrice;
  final String sales;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.sales,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
