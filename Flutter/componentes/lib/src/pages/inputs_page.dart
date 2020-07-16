import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ]
      ),
    );
  }

  Widget _crearInput() {
    return TextField(//Para la entrada de datos
      autofocus: false,//Para que el foco se coloque en automatico en el texto
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Cantidad de letras: ${_nombre.length}'),//para que cuente las letras del texto
        hintText: 'Nombre de la persona',//Para que aparesca una recomendacion
        helperText: 'Solo es el nombre', //Para dar ayuda
        suffixIcon: Icon(Icons.accessibility),//Para añadir iconos al final 
        icon: Icon(Icons.account_circle)//Para establecer iconos al inicio
      ),

      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(//Para la entrada de datos
      keyboardType: TextInputType.emailAddress,//Para que el teclado se adapte a la entrada requerida
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',//Para que aparesca una recomendacion
        suffixIcon: Icon(Icons.alternate_email),//Para añadir iconos al final 
        icon: Icon(Icons.email)//Para establecer iconos al inicio
      ),

      onChanged: (valor) => setState(() {
        _email = valor;
      })
    );
  }

  Widget _crearPassword() {
   return TextField(//Para la entrada de datos
      obscureText: true,//Para que aparezca como password
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',//Para que aparesca una recomendacion
        suffixIcon: Icon(Icons.lock_open),//Para añadir iconos al final 
        icon: Icon(Icons.lock)//Para establecer iconos al inicio
      ),
    );
  } 

  Widget _crearFecha(BuildContext context) {
    return TextField(//Para la entrada de datos
      enableInteractiveSelection: false,//Para que no pueda copiar el texto
      controller: _inputFieldDateController,//Asingando el controlador a la caja de texto
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      
        hintText: 'Fecha de nacimiento',//Para que aparesca una recomendacion
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),//Para añadir iconos al final 
        icon: Icon(Icons.calendar_today)//Para establecer iconos al inicio
      ),

      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());//Quitar el foco
        _selectDate(context);
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) { 
      lista.add(DropdownMenuItem(
        child: Text('$poder'),//Es el texto que se va a ver
        value: poder,//Valor del menu
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) { 
              setState(() {
              _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ]
    );
  }

  _selectDate(BuildContext context) async {
    DateTime pickedDate = await showDatePicker(
      context: context,//Para saber donde colocar el context
      initialDate: new DateTime.now(), //Donde saldra la fecha inicial
      firstDate: new DateTime(2015),//Año limite
      lastDate: new DateTime(2025)//Año limite superior
    );//Para elegir fechas

    if(pickedDate != null) {
      setState(() {
        _fecha = pickedDate.toString();
        _inputFieldDateController.text = _fecha;//Para poner la fecha en la caja
      });
    }
  }

  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSeleccionada = "Volar";
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Fuerza', 'Super Aliento'];
}