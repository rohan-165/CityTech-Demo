import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/product_detail/domain/model/product_detail_model.dart';
import 'package:product/product_detail/domain/repo/product_repo.dart';
import 'package:product/product_detail/presentation/product_detail_cubit/product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitialState());

  void getDetail() async {
    emit(
      state.copyWith(
        productDetailStatus: ProductDetailStatus.LOADING,
      ),
    );
    Response resp = await getIt<ProductRepo>().getProductDetail();
    if (resp.statusCode == 200 && resp.data != null) {
      ProductDetailModel? model;
      try {
        model = ProductDetailModel.fromJson(resp.data);
      } catch (e) {
        rethrow;
      }
      emit(
        state.copyWith(
            productDetailStatus: ProductDetailStatus.SUCCESS,
            productDetail: model),
      );
    } else {
      emit(
        state.copyWith(
          productDetailStatus: ProductDetailStatus.FAILURE,
        ),
      );
    }
  }
}
