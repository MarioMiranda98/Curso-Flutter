import 'package:flutter/material.dart';
 
//Importaciones
import 'package:componentes/src/providers/menu_provider.dart'; 
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),

      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);
    return FutureBuilder(
      future: menuProvider.cargarData(),//Debe enlazarse al future que se espera
      initialData: [],//Informacion que va a tener por defecto el future hasta que se resuelva
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
         //Se dispara en varias etapas
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },//Recibe una funcion que tiene por parametros el BuildContext y un AsyncSnapshot, debe regresar un widget
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      opciones.add(new ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent),
        onTap: () {
          //Para hacer un push en la nueva pagina

          //Este codigo sirve para ir a una sola pagina
          /*final route = MaterialPageRoute( //Se necesita esto
            builder: (context) => new AlertPage()
          ); 
          Navigator.push(context, route);//el metodo push requiere un contexto y una ruta*/

          //Para usar rutas con nombre
          Navigator.pushNamed(context, opt['ruta']);
        }
      ));

      opciones.add(Divider());
    });

    return opciones;
  }
}