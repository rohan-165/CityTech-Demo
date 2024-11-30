import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/product_detail/presentation/cubit/review_rating_cubit.dart';

import 'package:product/product_detail/presentation/widget/background_container.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      color: Colors.grey.shade100,
      child: Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Review",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            10.verticalSpace,
            Text(
              "Guest Full Name *",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            10.verticalSpace,
            TextFormField(
              controller: _name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Enter your full name",
                helperStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade500,
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            10.verticalSpace,
            Text(
              "Comments *",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            10.verticalSpace,
            TextFormField(
              controller: _comment,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your comments';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Enter your comments",
                helperStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                onTap: () {
                  if (_globalKey.currentState!.validate()) {
                    getIt<ReviewRatingCubit>().addReview(
                      name: _name.text.trim(),
                      comments: _comment.text.trim(),
                    );
                    _name.clear();
                    _comment.clear();
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
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
    );
  }
}
