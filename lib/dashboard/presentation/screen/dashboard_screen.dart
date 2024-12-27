import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:product/core/service/navigation_service.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/dashboard/mixin/alert_mixin.dart';
import 'package:product/dashboard/mixin/color_mixin.dart';
import 'package:product/dashboard/presentation/widget/custom_card.dart';
import 'package:product/dashboard/presentation/widget/outlet_report_widget.dart';
import 'package:product/dashboard/presentation/widget/transaction_report_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with ColorGenerator, AlertMixin {
  DateTime? lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        DateTime now = DateTime.now();
        if (lastBackPressed == null ||
            now.difference(lastBackPressed!) > const Duration(seconds: 10)) {
          lastBackPressed = now;
          Fluttertoast.showToast(
            msg: "Press back again to exit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        } else {
          getIt<NavigationService>().goBack();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Dashboard',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          actions: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              child: Text('CB', style: TextStyle(color: Colors.white)),
            ),
            10.horizontalSpace
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transaction Count",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                10.verticalSpace,
                GridView.count(
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.h,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.6,
                  children: [
                    CustomCard(
                        title: 'TOTAL',
                        count: '0',
                        color: generateRandomColor()),
                    CustomCard(
                        title: 'SALE',
                        count: '0',
                        color: generateRandomColor()),
                    CustomCard(
                        title: 'VOID',
                        count: '0',
                        color: generateRandomColor()),
                    CustomCard(
                        title: 'REFUND',
                        count: '0',
                        color: generateRandomColor()),
                    CustomCard(
                        title: 'DECLINED',
                        count: '0',
                        color: generateRandomColor()),
                    CustomCard(
                        title: 'FAILED',
                        count: '0',
                        color: generateRandomColor()),
                  ],
                ),
                10.verticalSpace,
                const TransactionReportWidget(),
                10.verticalSpace,
                const OutletReportWidget(),
                100.verticalSpace,
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: ElevatedButton.icon(
            onPressed: () {
              showWithdrawDialog(context);
            },
            icon: const Icon(Icons.account_balance_wallet),
            label: const Text('Withdraw Balance'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
