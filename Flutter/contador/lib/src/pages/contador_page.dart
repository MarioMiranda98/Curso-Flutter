import 'package:flutter/material.dart';

//Creando StatefulWidget
class ContadorPage extends StatefulWidget {
  //El statefulWidget necesita el estado de ese widget
  @override
  State<StatefulWidget> createState() => new _ContadorPageState();
  
}

//Por Convencion se nombra la clase seguida de State, aparte debe ser privada
//State es una clase generica, se debe especificar
//La clase especificada debe implementar el metodo createState
class _ContadorPageState extends State<ContadorPage> {
  //Aqui se implementa el metodo build, para pintar
  @override 
  Widget build(BuildContext context) {
    return Scaffold( //Scaffold es como una hoja que tiene un appBar 
      appBar: AppBar(
        title: Text("Contador"), //Para Colocar el titulo en el appBar, recibe un Widget (Text)
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
            Text("Numero de taps:", style: _estiloTexto),
            Text("$_conteo", style: _estiloTexto),
          ],
        )
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //Debe implementarse el onPressed
        onPressed: () {
          //print("Hola mundo")
          //Para repintar
          setState(() {
             _conteo += 1;
          });
        },
      ),*/

      floatingActionButton: _crearBotones(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,//Localizacion del floating button
    );    
  }

  Widget _crearBotones() {
    return Row (
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: _igualarACero, //Se pone la referencia a la funcion para que se ejecute cuando se presiona no antes
        ),

        Expanded(child: SizedBox()), //Similar a un div en html, con expanded los manda a lo mas posible estirado

        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: _disminuir,   
        ),

        SizedBox(width: 5.0), //Similar a un div en html

        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _agregar,
        ),
      ],
    );
  }

  void _agregar() {
    setState(() =>_conteo += 1); 
  }

  void _disminuir() {
    if(_conteo > 0)
      setState(() => _conteo -= 1);
  }

  void _igualarACero() {
    setState(() => _conteo = 0);
  }

  final TextStyle _estiloTexto = new TextStyle(fontSize: 25); 
  int _conteo = 0;
}