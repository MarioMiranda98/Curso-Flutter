//Archivo de utilidad   
import 'package:flutter/material.dart';

//definiendo un mapa
final _icons = <String, IconData>{
  'add_alert' : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open' : Icons.folder_open
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}