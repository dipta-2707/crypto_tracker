import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoChartWidget extends StatelessWidget {
  const CryptoChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        minX: 0,
        maxX: 20,
        minY: 0,
        maxY: 5,
        titlesData: FlTitlesData(
          show: false,
        ),
        gridData: FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        lineBarsData: [
          LineChartBarData(
              isCurved: false,
              belowBarData: BarAreaData(show: true),
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(3.1, 0),
              ])
        ]));
  }
}
