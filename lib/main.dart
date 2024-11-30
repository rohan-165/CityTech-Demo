import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product/core/route/route_generater.dart';
import 'package:product/core/service/local_notification_service.dart';
import 'package:product/core/service/navigation_service.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/product_detail/presentation/cubit/cart_item_cubit.dart';
import 'package:product/product_detail/presentation/cubit/review_rating_cubit.dart';
import 'package:product/product_detail/presentation/cubit/select_color_cubit.dart';
import 'package:product/product_detail/presentation/product_detail_cubit/product_detail_cubit.dart';
import 'core/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService notificationService = NotificationService();
  await notificationService.initializeNotifications();
  await notificationService.requestNotificationPermission();
  await Future.wait(
    [setupLocator()],
  );

  ScreenUtil.ensureScreenSize();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(value: getIt<ProductDetailCubit>()),
      BlocProvider.value(value: getIt<ReviewRatingCubit>()),
      BlocProvider.value(value: getIt<SelectColorCubit>()),
      BlocProvider.value(value: getIt<CartItemCubit>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: Routes.productDetailScreen,
          );
        });
  }
}
