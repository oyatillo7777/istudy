import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:istudy/chart/bar_data.dart';
import 'package:istudy/tools/colors.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;

  const MyBarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData mybarData = BarData(
      sumAmount: weeklySummary[0],
      munAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thurAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[6],
    );
    mybarData.initializeBarData();
    return BarChart(
      BarChartData(
          maxY: 100,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTitles,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          barGroups: mybarData.barData
              .map(
                (data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(toY: data.y, color: AppColors.primaryColor)
                ]),
              )
              .toList()),
    );
  }

}
Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff666E7A),
    fontWeight: FontWeight.normal,
    fontSize: 11,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        "Yan",
        style: style,
      );
      break;
    case 1:
      text = const Text(
        "Fev",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "Mart",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "Apr",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "May",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        "Iyun",
        style: style,
      );
      break;
    default:
      text = const Text(
        "",
        style: style,
      );
      break;
  }
  print("Value: $value, Text: ${text.toString()}");
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
