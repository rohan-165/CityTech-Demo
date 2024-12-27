// ignore: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:product/core/service/local_notification_service.dart';
import 'package:product/core/service/navigation_service.dart';
import 'package:product/core/service/network_service/api_manager.dart';
import 'package:product/core/service/network_service/api_request.dart';
import 'package:product/dashboard/data/repo/dashboard_repo_impl.dart';
import 'package:product/dashboard/domain/repo/product_repo.dart';
import 'package:product/dashboard/presentation/cubit/outlet_report_cubit/outlet_report_cubit.dart';
import 'package:product/dashboard/presentation/cubit/transaction_report_cubit/transaction_report_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<ApiRequest>(ApiRequestImpl());
  getIt<ApiRequest>().setApiManager(ApiManager());
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<NotificationService>(NotificationService());
  getIt.registerSingleton<DashBoardRepo>(DashBoardRepoImpl());
  getIt.registerSingleton<TransactionReportCubit>(TransactionReportCubit());
  getIt.registerSingleton<OutletReportCubit>(OutletReportCubit());
}
