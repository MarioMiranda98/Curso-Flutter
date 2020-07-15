import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      //El ListView es parecido a los Cols y Rows.
      body: ListView(
        /*children: <Widget>[
          //Para hacer listas de contactos usar ListTile
          ListTile(
            title: Text("ListTile Title"),
          ),
          Divider(),//Divider sirve para dividir, se visualiza como una raya
          ListTile(
            title: Text("ListTile Title"),
          )
        ],*/

        //Creando un ListView a partir de una lista
        children: _crearItemsCorto(),
      ),
    );
  }

  //Retorna la lista de items al ListView
  /*List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    //For in
    for(String opt in opciones) {
      /*lista.add(new ListTile(
        title: Text(opt),
      ));

      lista.add(Divider());*/

      //Sintaxis en cascada
      lista..add(new ListTile(
        title: Text(opt),
      ))
           ..add(Divider());
    }

    return lista;
  }*/

  List<Widget> _crearItemsCorto() {
    //Map regresa una lista iterable en su orden 
    return opciones.map((String f){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(f + "!"),
            subtitle: Text("Cualquier Cosa"),//Lo pone abajo del titulo
            leading: Icon(Icons.account_balance_wallet),//Añade un icono al ListTile a la izquierda
            trailing: Icon(Icons.keyboard_arrow_right),//Añade icono a la derecha
            onTap: () {},//onTap es un metodo que pone a la escucha el item del ListTile 
          ),
          Divider()
        ],
      );
    }).toList(); 
  }

  final List<String> opciones = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];
}