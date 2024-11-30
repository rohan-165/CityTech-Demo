// ignore: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:product/core/service/navigation_service.dart';
import 'package:product/product_detail/data/repo/product_repo_impl.dart';
import 'package:product/product_detail/domain/repo/product_repo.dart';
import 'package:product/product_detail/presentation/cubit/cart_item_cubit.dart';
import 'package:product/product_detail/presentation/cubit/review_rating_cubit.dart';
import 'package:product/product_detail/presentation/cubit/select_color_cubit.dart';
import 'package:product/product_detail/presentation/product_detail_cubit/product_detail_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<NavigationService>(NavigationService());

  getIt.registerSingleton<ProductDetailCubit>(ProductDetailCubit());
  getIt.registerSingleton<SelectColorCubit>(SelectColorCubit());
  getIt.registerSingleton<ReviewRatingCubit>(ReviewRatingCubit());
  getIt.registerSingleton<CartItemCubit>(CartItemCubit());
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl());
}
