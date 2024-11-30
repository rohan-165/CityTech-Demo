// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:product/product_detail/domain/model/product_detail_model.dart';

class CartModel {
  String? productCode;
  String? productName;
  int? quantity;
  ColorVariants? colorVariants;
  String? image;

  CartModel({
    this.productCode,
    this.productName,
    this.quantity,
    this.colorVariants,
    this.image,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    productCode = json['product_Code'];
    productName = json['product_name'];
    quantity = json['quantity'];
    colorVariants = json['color_variants'] != null
        ? ColorVariants.fromJson(json['color_variants'])
        : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_Code'] = productCode;
    data['product_name'] = productName;
    data['quantity'] = quantity;
    if (colorVariants != null) {
      data['color_variants'] = colorVariants!.toJson();
    }
    data['image'] = image;
    return data;
  }

  CartModel copyWith({
    String? productCode,
    String? productName,
    int? quantity,
    ColorVariants? colorVariants,
    String? image,
  }) {
    return CartModel(
      productCode: productCode ?? this.productCode,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      colorVariants: colorVariants ?? this.colorVariants,
      image: image ?? this.image,
    );
  }
}
