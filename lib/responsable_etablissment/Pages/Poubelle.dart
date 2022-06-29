// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Poubelle extends StatefulWidget {
  const Poubelle({Key? key}) : super(key: key);

  @override
  State<Poubelle> createState() => _PoubelleState();
}

class _PoubelleState extends State<Poubelle> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Poubelle"),
      ),
    );
  }
}
