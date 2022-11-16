import 'package:flutter/cupertino.dart';
import 'package:sql_netcore/widgets/constants.dart';
import 'package:sql_netcore/models/usuarios.dart';
import 'package:http/http.dart' as http;

const urlapi = url;

class Usuario_provider with ChangeNotifier {
  List<Usuario> usuarios = [];

  getUsuarios() async {
    final url1 = Uri.http(urlapi, 'api/Usuario');
    final resp = await http.get(url1, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    final response = usuarioFromJson(resp.body);
    usuarios == response;
    notifyListeners();
  }
}
