import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product/core/route/routes.dart';
import 'package:product/core/service/navigation_service.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/product_detail/domain/model/cart_model.dart';
import 'package:product/product_detail/presentation/cubit/cart_item_cubit.dart';
import 'package:product/product_detail/presentation/product_detail_cubit/product_detail_cubit.dart';
import 'package:product/product_detail/presentation/product_detail_cubit/product_detail_state.dart';
import 'package:product/product_detail/presentation/widget/product_detail_view.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    getIt<ProductDetailCubit>().getDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Product Detail Screen'),
        actions: [
          10.horizontalSpace,
          InkWell(
            onTap: () =>
                getIt<NavigationService>().navigateTo(Routes.cartScreen),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.add_shopping_cart_sharp,
                  size: 28.w,
                ),
                BlocBuilder<CartItemCubit, List<CartModel>>(
                  builder: (context, cartItem) {
                    return Visibility(
                      visible: cartItem.isNotEmpty,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Text("${cartItem.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          15.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            if (state.productDetailStatus == ProductDetailStatus.SUCCESS) {
              return ProductDetailView(
                model: state.productDetail,
              );
            } else if (state.productDetailStatus ==
                    ProductDetailStatus.LOADING ||
                state.productDetailStatus == ProductDetailStatus.INITIAL) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state.productDetailStatus ==
                ProductDetailStatus.FAILURE) {
              return Center(
                child: Column(
                  children: [
                    Text(state.productDetail.message ??
                        'Failed to load product detail'),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("No Data"),
              );
            }
          },
        ),
      ),
    );
  }
}
