import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product/core/route/routes.dart';
import 'package:product/core/service/local_notification_service.dart';
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
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _message = TextEditingController();
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
      floatingActionButton: InkWell(
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              insetPadding: EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: 20.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Form(
                key: _globalKey,
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _message,
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your message';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your message",
                          helperStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey.shade500,
                                  ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () async {
                            if (_globalKey.currentState!.validate()) {
                              await NotificationService().showNotification();
                              _message.clear();
                              getIt<NavigationService>().goBack();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.w),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(color: Colors.black)),
                            child: Text(
                              "Submit",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.all(15.w),
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            child: Icon(
              Icons.message_rounded,
              size: 32.w,
            ),
          ),
        ),
      ),
    );
  }
}
