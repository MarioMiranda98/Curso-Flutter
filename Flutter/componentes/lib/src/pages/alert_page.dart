import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),

      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context)
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, //Para cerrar el showDialog fuera de el 
      builder: (context) {
        return AlertDialog(
          title: Text('Titulo'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,//Para que se adapte al tamaño del contenido interno
            children: <Widget>[
              Text('Este es el contenido de la caja de alerta'),
              FlutterLogo(size: 100.0)
            ]
          ),//Acepta widgets

          actions: <Widget>[//Para poner botonones
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop()//Para salir de la alerta
            ),

            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }//debe regresar un widget
    );//EL show dialog es como java
  }
}