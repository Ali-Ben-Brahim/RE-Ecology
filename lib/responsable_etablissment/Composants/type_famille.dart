import 'package:flutter/material.dart';


import '../Pages/type_famille.dart';
import '../constans.dart';


class Famille extends StatefulWidget {
  const Famille({Key? key}) : super(key: key);

  @override
  State<Famille> createState() => _FamilleState();
}

class _FamilleState extends State<Famille> {
  List type=[
   { "img":"assets/images/plastique.png",
     "title": "Famille Plastique",
     "page" :  TYPEFAMILLE(type: "plastique",)
   },
    { "img":"assets/images/canette.png",
     "title": "Famille Canette",
     "page" : TYPEFAMILLE(type: "canette",)
   },
    { "img":"assets/images/papier.png",
     "title": "Famille papier",
     "page" : TYPEFAMILLE(type: "papier",)
   },
    { "img":"assets/images/composte.png",
     "title": "Famille composte",
     "page" : TYPEFAMILLE(type: "composte",)
   },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: type.length,
          itemBuilder: (BuildContext ctx, int index) {
            return GestureDetector(
    onTap: () {
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => type[index]["page"]),
          );
     
    },
    child: SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
    padding: const EdgeInsets.all(defaultPadding),
    decoration: const BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
          ),),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent
                        ]))),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                 Image.asset(
                  '${type[index]['img']}',width: 40,height: 40,),
                  const SizedBox(width: 10),
                  Text(type[index]["title"],
                      style: const TextStyle(color: Colors.white, fontSize: 25))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
   
   );
  }
}