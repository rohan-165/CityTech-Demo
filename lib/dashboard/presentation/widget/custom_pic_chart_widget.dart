import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomPicChartWidget extends StatelessWidget {
  final String title;
  final List<ChartData> chartData;
  const CustomPicChartWidget({
    super.key,
    required this.title,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      elevation: 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            10.verticalSpace,
            if (chartData.isEmpty) ...{
              SizedBox(
                width: double.maxFinite,
                height: 0.25.sh,
                child: Center(
                  child: Text('No data available',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            } else ...{
              SizedBox(
                height: 0.25.sh,
                child: SfCircularChart(
                  legend: const Legend(
                    isVisible: true,
                    position: LegendPosition.right,
                    alignment: ChartAlignment.center,
                    overflowMode: LegendItemOverflowMode.scroll,
                  ),
                  series: <CircularSeries>[
                    PieSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.label,
                      yValueMapper: (ChartData data, _) => data.value,
                      pointColorMapper: (ChartData data, _) => data.color,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String label;
  final double value;
  final Color color;

  ChartData({
    required this.label,
    required this.value,
    required this.color,
  });
}
