import 'package:flutter/material.dart';
import 'package:preferencias_de_usuario/src/pages/settings_page.dart';
import 'package:preferencias_de_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_de_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),

      drawer: MenuWidget(
        routeName: [
        HomePage.routeName,
        SettingsPage.routeName
        ]
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombre}'),
          Divider()
        ],
      ),
    );
  }
}