import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constans.dart';
import 'package:http/http.dart' as http;
import '../services/url.dart';
import 'dart:convert';

class Chart extends StatefulWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  String token = "1|Hbym1aZXorJ0S9l8ho7vH9jIW2C53ugGWHlr45dB";
  Map data = {};
  late double? sommeQtePlastique = 0;
 late double? sommeQtePapier = 0;
 late double? sommeQteCanette = 0;
  late double? sommeQteComposte = 0;
  late double pourcentage_qt_poubelle_plastique = 0;
  late double? pourcentage_qt_poubelle_papier = 0;
  late double? pourcentage_qt_poubelle_composte = 0;
  late double? pourcentage_qt_poubelle_canette = 0;
  double totale = 0;
  @override
  void initState() {
    afficherDashboard(token);

    super.initState();
  }

  Future afficherDashboard(token) async {
    Map dataList = {};
    try {
      http.Response response = await http.get(
        Uri.parse(dashboard),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        },
      );
      dataList = jsonDecode(response.body)[1];
      setState(() {
        data = dataList;
        sommeQtePlastique = data["somme_qt_dechet_plastique"];
        sommeQtePapier = data["somme_qt_dechet_papier"];
        sommeQteCanette = data["somme_qt_dechet_canette"];
        sommeQteComposte = data["somme_qt_dechet_composte"];
        pourcentage_qt_poubelle_plastique =
            data["pourcentage_plastique"];
        pourcentage_qt_poubelle_papier = data["pourcentage_papier"];
        pourcentage_qt_poubelle_composte =
            data["pourcentage_composte"];
        pourcentage_qt_poubelle_canette =
            data["pourcentage_canette"];
        totale = data["somme_qt_dechet"];
        print("totale :$totale");
      });

      return dataList;
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: totale == 0 && sommeQtePlastique == 0 
          ? const CircularProgressIndicator()
          : SizedBox(
              height: 200,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 70,
                      startDegreeOffset: -90,
                      sections: pieChart(),
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: defaultPadding),
                        Text(
                          "$totale KG",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  height: 0.5,
                                  fontSize: 20),
                        ),
                        const Text("Quantité Totale")
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  List<PieChartSectionData> pieChart() {
    List<PieChartSectionData> paiChartSelectionDatas = [
      PieChartSectionData(
        color: Color.fromARGB(255, 67, 227, 22),
        value: sommeQteComposte,
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: const Color(0xFF26E5FF),
        value: sommeQtePlastique,
        showTitle: false,
        radius: 22,
      ),
      PieChartSectionData(
        color: const Color(0xFFFFCF26),
        value: sommeQtePapier,
        showTitle: false,
        radius: 19,
      ),
      PieChartSectionData(
        color: const Color(0xFFEE2727),
        value: sommeQteCanette,
        showTitle: false,
        radius: 16,
      ),
    ];
    return paiChartSelectionDatas;
  }
}
