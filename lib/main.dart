import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product/core/route/route_generater.dart';
import 'package:product/core/service/local_notification_service.dart';
import 'package:product/core/service/navigation_service.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/dashboard/presentation/cubit/outlet_report_cubit/outlet_report_cubit.dart';
import 'package:product/dashboard/presentation/cubit/transaction_report_cubit/transaction_report_cubit.dart';
import 'core/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(
    [setupLocator()],
  );
  await getIt<NotificationService>().initializeNotifications();
  await getIt<NotificationService>().requestNotificationPermission();

  ScreenUtil.ensureScreenSize();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TransactionReportCubit>.value(
          value: getIt<TransactionReportCubit>()),
      BlocProvider<OutletReportCubit>.value(value: getIt<OutletReportCubit>()),
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
            initialRoute: Routes.dashboardScreen,
          );
        });
  }
}
