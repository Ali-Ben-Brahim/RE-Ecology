import 'package:flutter/material.dart';



AppBar getAppbar(String titleBar) {

  return  AppBar(
  backgroundColor: Colors.green,
  title: Text("$titleBar",style:  TextStyle(fontSize: 24),),
  centerTitle: true,
  
);
}
