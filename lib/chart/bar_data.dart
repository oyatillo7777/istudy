import 'package:istudy/chart/individual_bar.dart';

class BarData {
  final double sumAmount;
  final double munAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData(
      {required this.sumAmount,
      required this.munAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount});

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sumAmount),
      IndividualBar(x: 0, y: munAmount),
      IndividualBar(x: 0, y: tueAmount),
      IndividualBar(x: 0, y: wedAmount),
      IndividualBar(x: 0, y: tueAmount),
      IndividualBar(x: 0, y: friAmount),
      IndividualBar(x: 0, y: satAmount),
    ];
  }
}
