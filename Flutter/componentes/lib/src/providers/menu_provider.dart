//Este hace referencia al archivo JSON 
import 'package:flutter/services.dart' show rootBundle;//Para manipular archivos JSON
import 'dart:convert';

class _MenuProvider {

  _MenuProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    
    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }

  List<dynamic> opciones = [];
}

final _MenuProvider menuProvider = new _MenuProvider();