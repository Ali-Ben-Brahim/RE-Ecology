import 'package:flutter/material.dart';
import '../Data/data-part.dart';
import 'chart.dart';
import '../constans.dart';
import 'package:http/http.dart' as http;
import '../services/url.dart';
import 'dart:convert';
class StarageDetails extends StatefulWidget {
  const StarageDetails({Key? key}) : super(key: key);

  @override
  State<StarageDetails> createState() => _StarageDetailsState();
}

class _StarageDetailsState extends State<StarageDetails> {
    String token = "1|Hbym1aZXorJ0S9l8ho7vH9jIW2C53ugGWHlr45dB";
  Map data = {};
  double sommeQtePlastique = 0;
  double sommeQtePapier = 0;
  double sommeQteCanette = 0;
  double sommeQteComposte = 0;
  double? pourcentage_qt_poubelle_plastique = 0;
  double? pourcentage_qt_poubelle_papier = 0;
  double? pourcentage_qt_poubelle_composte = 0;
  double? pourcentage_qt_poubelle_canette = 0;
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
        totale = data["somme_qt_dechet"];
  
      });

      return dataList;
    } catch (_) {}
  }
  @override
  Widget build(BuildContext context) {
    return sommeQtePlastique==0?const CircularProgressIndicator(): Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children:  [
          const Text(
            "Taux de remplissage",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: defaultPadding),
          const Chart(),
          StorageInfoCard(
            svgSrc: "assets/images/plastique.png",
            title: const Text("Canette",maxLines: 1,
                    overflow: TextOverflow.ellipsis,style:  TextStyle(color:  Color(0xFF26E5FF))),
            amountOfFiles: "$pourcentage_qt_poubelle_plastique %",
            numOfFiles: sommeQtePlastique,
          ),
          StorageInfoCard(
            svgSrc: "assets/images/canette.png",
            title:const Text("Canette",maxLines: 1,
                    overflow: TextOverflow.ellipsis,style:  TextStyle(color: Color(0xFFEE2727))),
            amountOfFiles: "$pourcentage_qt_poubelle_canette %",
            numOfFiles: sommeQteCanette,
          ),
          StorageInfoCard(
            svgSrc: "assets/images/papier.png",
            title: const Text("Papier",maxLines: 1,
                    overflow: TextOverflow.ellipsis,style:  TextStyle(color: Color(0xFFFFCF26))),
            amountOfFiles: "$pourcentage_qt_poubelle_papier %",
            numOfFiles: sommeQtePapier,
          ),
          StorageInfoCard(
            svgSrc: "assets/images/composte.png",
            title: const Text("Canette",maxLines: 1,
                    overflow: TextOverflow.ellipsis,style: TextStyle(color: Color.fromARGB(255, 67, 227, 22))),
            amountOfFiles: "$pourcentage_qt_poubelle_composte %",
            numOfFiles: sommeQteComposte,
          ),
        ],
      ),
    );
  }
}
