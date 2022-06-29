import 'dart:convert';
import 'package:estionnaire/responsable_etablissment/services/url.dart';
import 'package:http/http.dart' as http;


Future getDonneeEtablisement(String token) async {
  Map dataList;
  try {
    var response = await http.get(
      Uri.parse(dashboard),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    dataList = jsonDecode(response.body)[0];
    
   

    return dataList;
  } catch (_) {}
}
Future getRepportingEtablissement(String token) async {
  Map dataList;
  
  try {
    var response = await http.get(
      Uri.parse(dashboard),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    dataList = jsonDecode(response.body)[1];
    
    


    return dataList;
  } catch (_) {}
}

Future getTypePoubelle(String token,String type) async {
  Map dataList;
  List data = [];
  try {
    var response = await http.get(
      Uri.parse(dashboard),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    dataList = jsonDecode(response.body)[2];
    data = dataList['poubelle_triee'];
     List.generate(data.length, (index) =>data = data[index][type] );
   

    return data;
  } catch (_) {}
}

