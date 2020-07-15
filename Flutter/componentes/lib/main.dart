//import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home: new HomePage()
      //Definiendo rutas para navegacion por nombre
      initialRoute: '/', //Debe colocarse esta para indicar cual es el home de la aplicacion
      routes: getAplicationRoutes(),

      /*onGenerateRoute: (RouteSettings settings) {
        print("Ruta llamada ${settings.name}");
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        );
      },*/ //Es una funcion que regresa una ruta dinamica
    );
  }
}