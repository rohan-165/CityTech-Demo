import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/product_detail/domain/model/cart_model.dart';
import 'package:product/product_detail/presentation/cubit/cart_item_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, List<CartModel>>(
      builder: (context, cartItem) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart Screen'),
          ),
          body: cartItem.isNotEmpty
              ? Column(
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.all(10.w),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              cartItem[index].image ?? '',
                              width: 90.w,
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem[index].productName ?? '',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  5.verticalSpace,
                                  Text(
                                    "Color : ${cartItem[index].colorVariants?.color?.name ?? ''}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  5.verticalSpace,
                                  Row(
                                    children: [
                                      Text(
                                        "Rs. ${cartItem[index].colorVariants?.price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        "Rs. ${cartItem[index].colorVariants?.strikePrice}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  5.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => getIt<CartItemCubit>()
                                            .removeQuantity(
                                                item: cartItem[index]),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 3.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error,
                                            ),
                                            color: Colors.red.withOpacity(0.2),
                                          ),
                                          child: Text("Remove",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if ((cartItem[index].quantity ??
                                                      0) >
                                                  1) {
                                                getIt<CartItemCubit>()
                                                    .subQuantity(
                                                        item: cartItem[index]);
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4.w,
                                                  vertical: 1.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                                color: Colors.black,
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: ((cartItem[index]
                                                                .quantity ??
                                                            0) >
                                                        1)
                                                    ? Colors.white
                                                    : Colors.grey.shade600,
                                              ),
                                            ),
                                          ),
                                          10.horizontalSpace,
                                          Text(
                                            "${cartItem[index].quantity}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          10.horizontalSpace,
                                          InkWell(
                                            onTap: () => getIt<CartItemCubit>()
                                                .addQuantity(
                                                    item: cartItem[index]),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4.w,
                                                  vertical: 1.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                                color: Colors.black,
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => 10.verticalSpace,
                      itemCount: cartItem.length,
                    ),
                    20.verticalSpace,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      width: double.infinity,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Price Summary",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                          ),
                          5.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                              ),
                              Text(
                                "Rs. ${getTotalAmount(data: cartItem)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                              )
                            ],
                          ),
                          5.verticalSpace,
                          Divider(
                            color: Colors.black,
                            thickness: 2.h,
                          ),
                          5.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Payable",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                              ),
                              Text(
                                "Rs. ${getTotalAmount(data: cartItem)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                              )
                            ],
                          ),
                          5.verticalSpace,
                          Divider(
                            color: Colors.black,
                            thickness: 2.h,
                          ),
                          5.verticalSpace,
                        ],
                      ),
                    ),
                    100.verticalSpace,
                  ],
                )
              : const Center(
                  child: Text("No Item Added"),
                ),
          bottomSheet: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs. ${getTotalAmount(data: cartItem)}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                ),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.green,
                        content: Text("Checkout Continue",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge), // The text to display in the snack bar
                      ),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: Colors.black,
                    ),
                    child: Text("Checkout",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getTotalAmount({required List<CartModel> data}) {
    double total = 0;
    for (var item in data) {
      total += ((item.quantity ?? 0) * (item.colorVariants?.price ?? 0));
    }
    return total.toStringAsFixed(2);
  }
}
