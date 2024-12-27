import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/core/utils/enum.dart';
import 'package:product/dashboard/mixin/color_mixin.dart';
import 'package:product/dashboard/presentation/cubit/transaction_report_cubit/transaction_report_cubit.dart';
import 'package:product/dashboard/presentation/widget/custom_pic_chart_widget.dart';
import 'package:product/dashboard/presentation/widget/error_widget.dart';

class TransactionReportWidget extends StatefulWidget {
  const TransactionReportWidget({super.key});

  @override
  State<TransactionReportWidget> createState() =>
      _TransactionReportWidgetState();
}

class _TransactionReportWidgetState extends State<TransactionReportWidget>
    with ColorGenerator {
  @override
  void initState() {
    super.initState();
    getIt<TransactionReportCubit>().reset();
    getIt<TransactionReportCubit>().getTransactionReport();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionReportCubit, TransactionReportState>(
      builder: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          return CustomPicChartWidget(
            title: "Transaction Report",
            chartData: state.data.data?.items
                    ?.map((e) => ChartData(
                        label: e.type ?? '',
                        value: (e.value ?? 0).toDouble(),
                        color: generateRandomColor()))
                    .toList() ??
                [],
          );
        } else if (state.apiStatus == ApiStatus.FAILURE) {
          return ErrorWidgetCustom(
            errorMessage: state.failureState.message,
            onTap: () => getIt<TransactionReportCubit>().getTransactionReport(),
          );
        } else if (state.apiStatus == ApiStatus.INITIAL ||
            state.apiStatus == ApiStatus.LOADING) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
