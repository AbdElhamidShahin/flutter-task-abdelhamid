import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_packages_model.g.dart';

@JsonSerializable()
class AddPackagesModel {
  int id;
  String name;
  String price;
  String currency;
  int duration;
  List<String> features;

  AddPackagesModel(
    this.id,
    this.name,
    this.price,
    this.currency,
    this.duration,
    this.features,
  );

  factory AddPackagesModel.fromJson(Map<String, dynamic> json) =>
      _$AddPackagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddPackagesModelToJson(this);
}
