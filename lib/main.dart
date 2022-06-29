import 'package:estionnaire/gestionnaire/pages/login.dart';
import 'package:estionnaire/gestionnaire/provider/client_provider.dart';
import 'package:estionnaire/gestionnaire/provider/dashboard_provider.dart';
import 'package:estionnaire/gestionnaire/provider/dechets_provider.dart';
import 'package:estionnaire/gestionnaire/provider/login_provider.dart';
import 'package:estionnaire/gestionnaire/provider/ouvrier_provider.dart';
import 'package:estionnaire/gestionnaire/provider/reparateurs_provider.dart';
import 'package:estionnaire/gestionnaire/provider/responsable_etablissement_provider.dart';
import 'package:estionnaire/responsable_etablissment/pages/acceuil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => OuvrierProvider()),
        ChangeNotifierProvider(create: (_) => ClientProvider()),
        ChangeNotifierProvider(create: (_) => ResponsableEtablissmentProvider()),
        ChangeNotifierProvider(create: (_) => DechetsProvider()),
        ChangeNotifierProvider(create: (_) => ReparateursProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RE::SCHOOL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login()
    );
  }
}

