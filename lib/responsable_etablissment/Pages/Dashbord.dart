// ignore_for_file: file_names

import 'package:flutter/material.dart';


import '../Composants/app_bar.dart';
import '../Composants/partie3.dart';
import '../Composants/type_famille.dart';
import '../Data/Dashboard1.dart';
import '../constans.dart';


class Dashbord extends StatelessWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar("Dashbord"),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children:  const [
                        SizedBox(height:400 , child: Dashbord1()),
                        SizedBox(height: defaultPadding),
                        SizedBox(height: 400, child: Famille()),
                        SizedBox(height: defaultPadding),
                        StarageDetails(),
                      ],
                    ),
                  ),
],
              )
            ],
          ),
        ),
      ),
    );

  }
}