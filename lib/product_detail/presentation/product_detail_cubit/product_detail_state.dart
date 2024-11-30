// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:product/product_detail/domain/model/product_detail_model.dart';

enum ProductDetailStatus { INITIAL, LOADING, SUCCESS, FAILURE }

abstract class ProductDetailState {
  ProductDetailStatus productDetailStatus;
  ProductDetailModel productDetail;
  ProductDetailState({
    required this.productDetailStatus,
    required this.productDetail,
  });

  ProductDetailState copyWith({
    ProductDetailStatus? productDetailStatus,
    ProductDetailModel? productDetail,
  }) {
    return ProductDetailStateImpl(
      productDetailStatus: productDetailStatus ?? this.productDetailStatus,
      productDetail: productDetail ?? this.productDetail,
    );
  }
}

class ProductDetailStateImpl extends ProductDetailState {
  ProductDetailStateImpl({
    required super.productDetailStatus,
    required super.productDetail,
  });

  @override
  ProductDetailStateImpl copyWith({
    ProductDetailStatus? productDetailStatus,
    ProductDetailModel? productDetail,
  }) {
    return ProductDetailStateImpl(
      productDetailStatus: productDetailStatus ?? this.productDetailStatus,
      productDetail: productDetail ?? this.productDetail,
    );
  }
}

class ProductDetailInitialState extends ProductDetailState {
  ProductDetailInitialState()
      : super(
          productDetail: ProductDetailModel(),
          productDetailStatus: ProductDetailStatus.INITIAL,
        );
}
