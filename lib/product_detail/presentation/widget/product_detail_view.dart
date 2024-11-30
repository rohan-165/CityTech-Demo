import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:product/product_detail/domain/model/product_detail_model.dart';
import 'package:product/product_detail/presentation/cubit/select_color_cubit.dart';
import 'package:product/product_detail/presentation/widget/add_cart_widget.dart';
import 'package:product/product_detail/presentation/widget/background_container.dart';
import 'package:product/product_detail/presentation/widget/glass_effect.dart';
import 'package:product/product_detail/presentation/widget/review_widget.dart';
import 'package:product/product_detail/presentation/widget/review_rating.dart';

class ProductDetailView extends StatefulWidget {
  final ProductDetailModel model;
  const ProductDetailView({
    super.key,
    required this.model,
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late ProductDetailModel model;
  final ValueNotifier<String> _imageUrl = ValueNotifier<String>('');
  final ValueNotifier<bool> _description = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _ingredient = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _howToUse = ValueNotifier<bool>(false);

  @override
  void initState() {
    model = widget.model;
    _imageUrl.value = model.data?.images?.firstOrNull ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackgroundContainer(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image View
                ValueListenableBuilder(
                    valueListenable: _imageUrl,
                    builder: (_, imageUrl, __) {
                      return Container(
                        padding: EdgeInsets.only(
                          top: 180.h,
                        ),
                        width: double.infinity,
                        height: 250.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: GlassEffectWidget(
                          child: (model.data?.images ?? []).isNotEmpty
                              ? Row(
                                  children: List.generate(
                                    (model.data?.images ?? []).length,
                                    (index) => InkWell(
                                      onTap: () => _imageUrl.value =
                                          (model.data?.images ?? [])[index],
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                        ),
                                        height: 80.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          border: Border.all(
                                            color: (model.data?.images ??
                                                        [])[index] ==
                                                    imageUrl
                                                ? Colors.black
                                                : Colors.black12,
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                (model.data?.images ??
                                                    [])[index]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      );
                    }),

                /// Detail View

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<SelectColorCubit, ColorVariants>(
                    builder: (context, selectColor) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.data?.brand?.name ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    model.data?.title ?? '',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 28.w,
                                ),
                              )
                            ],
                          ),
                          10.verticalSpace,
                          Text(
                            "Code: ${selectColor.productCode ?? ''}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Rating",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              20.horizontalSpace,
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => const Icon(
                                          Icons.star_border_sharp,
                                          color: Colors.grey,
                                        )),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          AddCartWidget(
                            model: model,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          ///description
          if ((model.data?.description ?? '').isNotEmpty) ...{
            10.verticalSpace,
            ValueListenableBuilder(
                valueListenable: _description,
                builder: (_, expand1, __) {
                  return InkWell(
                    onTap: () {
                      _description.value = !_description.value;
                      _howToUse.value = false;
                      _ingredient.value = false;
                    },
                    child: BackgroundContainer(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Product Description",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                              ),
                              Icon(
                                expand1
                                    ? Icons.keyboard_arrow_down_sharp
                                    : Icons.keyboard_arrow_right_rounded,
                                size: 24.w,
                              )
                            ],
                          ),
                          if (expand1) ...{
                            10.verticalSpace,
                            HtmlWidget(model.data?.description ?? '')
                          },
                        ],
                      ),
                    ),
                  );
                }),
          },

          ///ingredient
          if ((model.data?.ingredient ?? '').isNotEmpty) ...{
            10.verticalSpace,
            ValueListenableBuilder(
                valueListenable: _ingredient,
                builder: (_, expand2, __) {
                  return InkWell(
                    onTap: () {
                      _description.value = false;
                      _howToUse.value = false;
                      _ingredient.value = !_ingredient.value;
                    },
                    child: BackgroundContainer(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Product Ingredient",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                              ),
                              Icon(
                                expand2
                                    ? Icons.keyboard_arrow_down_sharp
                                    : Icons.keyboard_arrow_right_rounded,
                                size: 24.w,
                              )
                            ],
                          ),
                          if (expand2) ...{
                            10.verticalSpace,
                            HtmlWidget(model.data?.ingredient ?? '')
                          },
                        ],
                      ),
                    ),
                  );
                }),
          },

          /// howToUse
          if ((model.data?.howToUse ?? '').isNotEmpty) ...{
            10.verticalSpace,
            ValueListenableBuilder(
                valueListenable: _howToUse,
                builder: (_, expand3, __) {
                  return InkWell(
                    onTap: () {
                      _description.value = false;
                      _howToUse.value = !_howToUse.value;
                      _ingredient.value = false;
                    },
                    child: BackgroundContainer(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "How To Use?",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                              ),
                              Icon(
                                expand3
                                    ? Icons.keyboard_arrow_down_sharp
                                    : Icons.keyboard_arrow_right_rounded,
                                size: 24.w,
                              )
                            ],
                          ),
                          if (expand3) ...{
                            10.verticalSpace,
                            HtmlWidget(model.data?.howToUse ?? '')
                          },
                        ],
                      ),
                    ),
                  );
                }),
          },
          20.verticalSpace,
          const ReviewRating(),
          40.verticalSpace,
          const ReviewWidget(),
          40.verticalSpace,
        ],
      ),
    );
  }
}
