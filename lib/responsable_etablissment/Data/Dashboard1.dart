// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



import '../constans.dart';
import '../services/function.dart';
import '../services/url.dart';
import 'info.dart';

class Dashbord1 extends StatefulWidget {
  const Dashbord1({Key? key}) : super(key: key);

  @override
  State<Dashbord1> createState() => _Dashbord1State();
}

class _Dashbord1State extends State<Dashbord1> {
  String token = "1|Hbym1aZXorJ0S9l8ho7vH9jIW2C53ugGWHlr45dB";
  Map data = {};
   Map nombreP = {};
  @override
  void initState() {
    afficherDashboard(token);
    nombre(token);
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
      });

      return dataList;
    } catch (_) {}
  }

  Future nombre(token) async {
    Map dataList = {};
    try {
      http.Response response = await http.get(
        Uri.parse(dashboard),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        },
      );
      dataList = jsonDecode(response.body)[0];
      setState(() {
        nombreP = dataList;
      });

      return dataList;
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data.isEmpty && nombreP.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(0),
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
                shrinkWrap: true,
                childAspectRatio: 1,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.all(defaultPadding * 0.75),
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Image.asset(
                                "assets/images/plastique.png",
                              ),
                            ),
                            Text("(${nombreP['poubelle_plastique']} P)")
                          ],
                        ),
                         const Text("Plastique",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        ProgressLine(
                          color:
                              check(data["pourcentage_qt_poubelle_plastique"]),
                          percentage: data["pourcentage_qt_poubelle_plastique"],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data["somme_qt_dechet_plastique"]} Kg",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white70),
                            ),
                            Text(
                              "${data["pourcentage_qt_poubelle_plastique"]} %",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.all(defaultPadding * 0.75),
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Image.asset(
                                "assets/images/canette.png",
                              ),
                            ),
                            Text("(${nombreP['poubelle_canette']} P)")
                          ],
                        ),
                         const Text("canette",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(color: Colors.white, fontSize: 16)),
                        ProgressLine(
                          color: check(data["pourcentage_qt_poubelle_canette"]),
                          percentage: data["pourcentage_qt_poubelle_canette"],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data["somme_qt_dechet_canette"]} Kg",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white70),
                            ),
                            Text(
                              "${data["pourcentage_qt_poubelle_canette"]} %",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.all(defaultPadding * 0.75),
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Image.asset(
                                "assets/images/papier.png",
                              ),
                            ),
                           Text("(${nombreP['poubelle_papier']} P)"),
                          ],
                        ),
                         const Text("papier ",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                           TextStyle(color: Colors.white, fontSize: 16)),
                        ProgressLine(
                          color: check(data["pourcentage_qt_poubelle_papier"]),
                          percentage: data["pourcentage_qt_poubelle_papier"],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data["somme_qt_dechet_papier"]} Kg",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white70),
                            ),
                            Text(
                              "${data["pourcentage_qt_poubelle_papier"]} %",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.all(defaultPadding * 0.75),
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Image.asset(
                                "assets/images/composte.png",
                              ),
                            ),
                             Text("(${nombreP['poubelle_composte']} P)")
                          ],
                        ),
                         const Text("composte",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(color: Colors.white, fontSize: 16)),
                        ProgressLine(
                          color:
                              check(data["pourcentage_qt_poubelle_composte"]),
                          percentage: data["pourcentage_qt_poubelle_composte"],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data["somme_qt_dechet_composte"]} Kg",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white70),
                            ),
                            Text(
                              "${data["pourcentage_qt_poubelle_composte"]} %",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
