import 'package:flutter/material.dart';

import 'package:preferencias_de_usuario/src/pages/home_page.dart';
import 'package:preferencias_de_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_de_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _textController;
  String _nombre = 'Pedro';
  bool _colorSecundario = false;
  int _genero;
  final prefs = PreferenciasUsuario();

  @override
  void initState() { 
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _textController = TextEditingController(text:  prefs.nombre);  
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),

      drawer: MenuWidget(
        routeName: [
          HomePage.routeName,
          SettingsPage.routeName
        ],
      ),
      body: ListView(
        children: <Widget> [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45.0
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() { 
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
           RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Usuario del telefono'
              ),

              onChanged: (value) {
                setState(() {
                  prefs.nombre = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) {
    prefs.genero = value;
    _genero = value;
    setState(() {});
  }
}