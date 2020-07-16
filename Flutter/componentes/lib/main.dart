//import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [//Para tener widgets en diferentes idiomas
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'), 
      ],
      //home: new HomePage()
      //Definiendo rutas para navegacion por nombre
      initialRoute: '/', //Debe colocarse esta para indicar cual es el home de la aplicacion
      routes: getAplicationRoutes(),

      onGenerateRoute: (RouteSettings settings) {
        print("Ruta llamada ${settings.name}");
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage(),
        );
      }, //Es una funcion que regresa una ruta dinamica
    );
  }
}