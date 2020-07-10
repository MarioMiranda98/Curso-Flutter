import 'package:flutter/material.dart';
//import 'package:contador/src/pages/home_page.dart';
import 'package:contador/src/pages/contador_page.dart';

class MyApp extends StatelessWidget{
  //El metodo build debe implementarse, ya que este va a pintar 
  @override
  Widget build(BuildContext context) { //El BuildContext trabaja con el arbol de widgets
    return MaterialApp(
      debugShowCheckedModeBanner: false,//Para quitar el banner de debug
      home: new ContadorPage(),//Para centrarlo se usa el center
    ); //Recibe entre los argumentos lo que es un home(widget)
  }
}