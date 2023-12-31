import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoChartWidget extends StatelessWidget {
  final List<List<double>> dataList;
  const CryptoChartWidget({
    super.key,
    required this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        titlesData: const FlTitlesData(
          show: false,
        ),
        gridData: const FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: false,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: true),
            spots: dataList.map((e) => FlSpot(e[0], e[1])).toList(),
          )
        ]));
  }
}
