import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scaffold es como una hoja que tiene un appBar 
      appBar: AppBar(
        title: Text("Titulo"), //Para Colocar el titulo en el appBar, recibe un Widget (Text)
        centerTitle: true, //Para centrar el titulo de la appBar
      ),

      //La mayoria de los widgets solo pueden tener un hijo
      //El body es el cuerpo de la aplicacion.
      //body: Center(child: Text("Numero de taps"),),
      //Para poner varios widgets con arreglo de columna
      body: Center(
        //Column acomoda los widgets de manera vertical 
        child: Column(
          //Para acomodar la columna
          mainAxisAlignment: MainAxisAlignment.center,
          //Para añadir varios hijos
          children: <Widget>[
            Text("Numero de taps:", style: estiloTexto),
            Text("0", style: estiloTexto),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //Debe implementarse el onPressed
        onPressed: () {
          print("Hola mundo");
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,//Localizacion del floating button
    );    
  }

  final TextStyle estiloTexto = new TextStyle(fontSize: 25);
}