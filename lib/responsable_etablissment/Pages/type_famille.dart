import 'package:flutter/material.dart';


import '../constans.dart';
import '../services/data_servics.dart';

class TYPEFAMILLE extends StatefulWidget {
  const TYPEFAMILLE({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<TYPEFAMILLE> createState() => _TYPEFAMILLEState();
}

class _TYPEFAMILLEState extends State<TYPEFAMILLE> {
  int? sortColumnIndex;
  bool isAscending = false;
  @override
  void initState() {
    familleType();
    totale();
    super.initState();
  }

  Map _count = {};
  List totaleFamille = [];
  List typeFamille = [];
  double quantite = 0;
  double avg = 0;
  String token = "1|Hbym1aZXorJ0S9l8ho7vH9jIW2C53ugGWHlr45dB";
  familleType() async {
    List<dynamic> dataetab;
    dataetab = await getTypePoubelle(token, widget.type);
    if (mounted) {
      setState(() {
        typeFamille = dataetab;
      });
    }
  }

  count() async {
    Map dataetab;
    dataetab = await getDonneeEtablisement(token);
    if (mounted) {
      setState(() {
        _count = dataetab;
      });
    }
  }

  totale() async {
    Map dataetab;
    dataetab = await getRepportingEtablissement(token);
    if (mounted) {
      setState(() {
        quantite = dataetab["somme_qt_dechet_${widget.type}"];
        avg = dataetab["pourcentage_qt_poubelle_${widget.type}"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: secondaryColor),
      body: typeFamille.isEmpty && avg == 0.0 && quantite == 0.0
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: double.infinity,
              padding: const EdgeInsets.all(defaultPadding),
              decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tout les poubelles ${widget.type}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: DataTable(
                        columnSpacing: defaultPadding,
                        sortColumnIndex: sortColumnIndex,
                        sortAscending: isAscending,
                        columns: [
                          DataColumn(
                            label: const Text("Lieu"),
                            onSort: onSort,
                          ),
                          DataColumn(
                            label: const Text("État"),
                            onSort: onSort,
                          ),
                          DataColumn(
                            label: const Text("Quantité"),
                            onSort: onSort,
                          ),
                        ],
                        rows: List.generate(
                          typeFamille.length,
                          (index) =>
                              recentFileDataRow(typeFamille[index], index),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nombre de bloc: ${_count['bloc_poubelles_count']}",
                    maxLines: 2,
                  ),
                  Text(
                    "Nombre de poubelle : ${_count['poubelle_${widget.type}']}",
                    maxLines: 2,
                  ),
                  Text(
                    "état moyenne: $avg %",
                    maxLines: 2,
                  ),
                  Text(
                    "Quantité Totale : $quantite Kg",
                    maxLines: 2,
                  ),
                ],
              ),
            ),
    );
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      typeFamille.sort((a, b) {
        return compareString(
            ascending, a["etage"].toString(), b["etage"].toString());
      });
    } else if (columnIndex == 1) {
      typeFamille.sort((a, b) {
        return compareTo(ascending, a["Etat"].toDouble(), b["Etat"].toDouble());
      });
    } else if (columnIndex == 2) {
      typeFamille.sort((a, b) {
        return compareTo(
            ascending, a["quantite"].toDouble(), b["quantite"].toDouble());
      });
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascendig, String value1, String value2) {
    return ascendig ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  int compareTo(bool ascendig, double value1, double value2) {
    return ascendig ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  DataRow recentFileDataRow(dynamic typeFamille, int index) {
    return DataRow(
      cells: [
        DataCell(
          Text("E:${typeFamille["etage"]} - BP:$index-${index + 4}",
              maxLines: 1),
        ),
        DataCell(Text("${typeFamille["Etat"]} %")),
        DataCell(Text("${typeFamille["quantite"]} Kg")),
      ],
    );
  }
}
