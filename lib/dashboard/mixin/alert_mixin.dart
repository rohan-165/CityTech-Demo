import 'package:flutter/material.dart';
import 'package:product/core/service/local_notification_service.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/dashboard/presentation/widget/custom_alert_view.dart';

mixin AlertMixin {
  void showWithdrawDialog(BuildContext context) async {
    await showDialog<double>(
      context: context,
      builder: (context) => WithdrawAmountDialog(
        onTap: (amount) =>
            getIt<NotificationService>().showNotification(amount: amount),
      ),
    );
  }
}
