import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:product/product_detail/domain/model/review_model.dart';
import 'package:product/product_detail/presentation/cubit/review_rating_cubit.dart';

class ReviewRating extends StatefulWidget {
  const ReviewRating({super.key});

  @override
  State<ReviewRating> createState() => _ReviewRatingState();
}

class _ReviewRatingState extends State<ReviewRating> {
  final ValueNotifier<bool> _viewAll = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewRatingCubit, List<ReviewModel>>(
      builder: (context, state) {
        return ValueListenableBuilder(
            valueListenable: _viewAll,
            builder: (_, viewAll, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rating & Reviews",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      if (state.length > 2) ...{
                        InkWell(
                            onTap: () => _viewAll.value = !_viewAll.value,
                            child: Text(
                              viewAll ? "View Lesss" : "View All",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline,
                                  ),
                            )),
                      } else ...{
                        const SizedBox(),
                      }
                    ],
                  ),
                  15.verticalSpace,
                  if (state.isNotEmpty) ...{
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            size: 32.w,
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state[index].name ?? '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                formatDateTime(DateTime.now()),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              5.verticalSpace,
                              Text(
                                state[index].comment ?? '-',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          )
                        ],
                      ),
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                      itemCount:
                          (!viewAll && state.length > 2) ? 2 : state.length,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  } else ...{
                    Text(
                      "No reviews found!",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  }
                ],
              );
            });
      },
    );
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy MMM d, hh:mm a');
    return formatter.format(dateTime);
  }
}
