import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product/core/route/routes.dart';
import 'package:product/core/service/navigation_service.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/product_detail/domain/model/cart_model.dart';
import 'package:product/product_detail/domain/model/product_detail_model.dart';
import 'package:product/product_detail/presentation/cubit/cart_item_cubit.dart';
import 'package:product/product_detail/presentation/cubit/select_color_cubit.dart';

class AddCartWidget extends StatefulWidget {
  final ProductDetailModel model;
  const AddCartWidget({
    super.key,
    required this.model,
  });

  @override
  State<AddCartWidget> createState() => _AddCartWidgetState();
}

class _AddCartWidgetState extends State<AddCartWidget> {
  final ValueNotifier<int> _quantity = ValueNotifier<int>(1);
  late List<ColorVariants> data;
  @override
  void initState() {
    data = widget.model.data?.colorVariants ?? [];
    getIt<SelectColorCubit>()
        .selectColor(color: data.firstOrNull ?? ColorVariants());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectColorCubit, ColorVariants>(
      builder: (context, selectColor) {
        return ValueListenableBuilder(
            valueListenable: _quantity,
            builder: (_, quantity, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Rs. ${selectColor.price}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      20.horizontalSpace,
                      Text(
                        "Rs. ${selectColor.strikePrice}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      20.horizontalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 3.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: Colors.blueAccent)),
                        child: Text(
                          "${selectColor.offPercent}% off",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.blueAccent,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Color",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: " (${selectColor.color?.name ?? ''})",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ]),
                  ),
                  10.verticalSpace,
                  Row(
                    children: List.generate(
                        data.length,
                        (index) => InkWell(
                              onTap: () => getIt<SelectColorCubit>()
                                  .selectColor(color: data[index]),
                              child: Container(
                                padding: EdgeInsets.all(4.r),
                                margin: EdgeInsets.only(right: 10.w),
                                height: 25.r,
                                width: 25.r,
                                decoration: BoxDecoration(
                                    color: ((data[index]
                                                    .color
                                                    ?.colorValue
                                                    ?.firstOrNull ??
                                                '')
                                            .isNotEmpty)
                                        ? hexToColor((data[index]
                                                .color
                                                ?.colorValue
                                                ?.firstOrNull ??
                                            "#A14940"))
                                        : Colors.grey,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: (data[index]
                                                  .color
                                                  ?.colorValue
                                                  ?.firstOrNull ==
                                              selectColor.color?.colorValue
                                                  ?.firstOrNull)
                                          ? Colors.black
                                          : Colors.transparent,
                                      width: 2.w,
                                    )),
                              ),
                            )),
                  ),
                  10.verticalSpace,
                  Text(
                    "Select Quantity",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  10.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.w,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            if (quantity > 1) {
                              _quantity.value = (_quantity.value - 1);
                            }
                          },
                          child: Icon(
                            Icons.remove,
                            color: quantity > 1
                                ? Colors.white
                                : Colors.grey.shade700,
                            size: 28.w,
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          "$quantity",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        10.horizontalSpace,
                        InkWell(
                          onTap: () => _quantity.value = (_quantity.value + 1),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 28.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        getIt<CartItemCubit>().addItem(
                          item: CartModel(
                            productName: widget.model.data?.title,
                            productCode: selectColor.productCode,
                            quantity: quantity,
                            image: widget.model.data?.images?.firstOrNull,
                            colorVariants: selectColor,
                          ),
                        );
                        _quantity.value = 1;
                        getIt<NavigationService>()
                            .navigateTo(Routes.cartScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.w,
                          vertical: 6.w,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Text("Add To Cart",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                )),
                      ),
                    ),
                  )
                ],
              );
            });
      },
    );
  }

  // Utility function to convert #RRGGBB to Color
  Color hexToColor(String hexCode) {
    return Color(int.parse(hexCode.replaceFirst('#', '0xFF')));
  }
}
