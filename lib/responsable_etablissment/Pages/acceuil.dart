import 'package:flutter/material.dart';


import '../Composants/app_bar.dart';
import 'HomePage.dart';

class AcceuilResponsableEtablissement extends StatelessWidget {
  const AcceuilResponsableEtablissement({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    List acceuil = [
      {
        "image": "assets/images/dashboard.png",
        "title": "Dashboard",
        "page": HomePage(num: 0,)
      },
      {
        "image": "assets/images/calendar.png",
        "title": "Plannig",
        "page": HomePage(num: 1,)
      },
      {"image": "assets/images/map.png", "title": "Map", "page": HomePage(num: 2,)},
      {
        "image": "assets/images/support.png",
        "title": "Service Client",
        "page": HomePage(num: 3,)
      },
      {
        "image": "assets/images/settings.png",
        "title": "Paramettres",
        "page": HomePage(num: 4,)
      },
    ];

    return Scaffold(
      appBar: getAppbar("Acceuil"),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.9,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          itemCount: acceuil.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => acceuil[index]["page"]),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    acceuil[index]["image"],
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    acceuil[index]["title"],
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            );
          }),
    );
  }
}
