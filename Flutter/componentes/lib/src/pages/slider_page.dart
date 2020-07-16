import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheck(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ]
        )
      )
    );
  }

  Widget _crearSlider() {
    return Slider(//Para crear un Slider
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider, //Valor inicial
      min: 10.0, //Valor minimo
      max: 400.0,//Valor maximo
      onChanged: (_bloquearCheck) ? null : ((valor) {
        //print(valor);
        setState(() {
            _valorSlider = valor;
        });
      }),
    );
  }

  Widget _crearCheck() {
    /*eturn Checkbox(
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      }, 
    );*/

    return CheckboxListTile(
      value: _bloquearCheck,
      title:  Text('Bloquear Slider'),
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      }, 
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      value: _bloquearCheck,
      title:  Text('Bloquear Slider'),
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      }, 
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://www.oconowocc.com/wp-content/uploads/2013/01/ken01.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain
    );
  }

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
}