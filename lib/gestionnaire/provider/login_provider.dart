
import 'dart:convert';
import 'package:estionnaire/responsable_etablissment/pages/acceuil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import '../../responsable_etablissment/Pages/acceuil.dart';
import '../services/login_services.dart';

class LoginProvider extends ChangeNotifier{

  LoginServices _login = LoginServices();

  login(data,context)async{
    http.Response res =await _login.login(data);
    if(res.statusCode==200){
      dynamic data = jsonDecode(res.body);
      dynamic role = data['Role'];  
      if(role=='gestionnaire'){

      }
      if(role=='responsable_etablissement'){
        Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AcceuilResponsableEtablissement()),
                );
      }
      if(role=='client_dechet'){

      }
      if(role=='ouvrier'){

      }
      if(role=='responsable_personnel'){

      }
      if(role=='responsable_commerciale'){

      }
    }
    print(res.body);
  }
}