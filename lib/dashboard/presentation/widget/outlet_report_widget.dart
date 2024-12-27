import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/core/utils/enum.dart';
import 'package:product/dashboard/mixin/color_mixin.dart';
import 'package:product/dashboard/presentation/cubit/outlet_report_cubit/outlet_report_cubit.dart';
import 'package:product/dashboard/presentation/widget/custom_pic_chart_widget.dart';
import 'package:product/dashboard/presentation/widget/error_widget.dart';

class OutletReportWidget extends StatefulWidget {
  const OutletReportWidget({super.key});

  @override
  State<OutletReportWidget> createState() => _OutletReportWidgetState();
}

class _OutletReportWidgetState extends State<OutletReportWidget>
    with ColorGenerator {
  @override
  void initState() {
    super.initState();
    getIt<OutletReportCubit>().reset();
    getIt<OutletReportCubit>().getOutletReport();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutletReportCubit, OutletReportState>(
      builder: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          return CustomPicChartWidget(
            title: "Outlet Report",
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
            onTap: () => getIt<OutletReportCubit>().getOutletReport(),
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
