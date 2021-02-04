import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:formvalidation/src/utils/utils.dart' as utils;
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/producto_provider.dart';
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProductoModel producto = new ProductoModel();
  final productoProvider = ProductoProvider();
  bool _guardando = false;  
  File foto;

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if(prodData != null) producto = prodData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(context),
              ]
            )
          ),
        )
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if(value.length < 3) return 'Ingrese el nombre del producto';
        else return null;
      },
    );
  }

  Widget _crearPrecio() {
    return  TextFormField(
      initialValue: producto.valor.toString(  ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true
      ),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {
        if(utils.isNumeric(value)) return null;
        else return 'Solo números';
      },
    );
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: () => (!_guardando) ? _submit(context) : null,
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) {
        setState(() {
          producto.disponible = value;         
        });
      },
    );
  }

  void _submit(BuildContext context) async {
    if(!formKey.currentState.validate()) return;

    // if(formKey.currentState.validate()) {
    // Cuando el formulario es valido
    // }
    formKey.currentState.save();  

    setState(() { _guardando = true; });

    if(foto != null) {
      producto.fotoUrl = await productoProvider.subirImagen(foto);
    }

    if(producto.id == null) 
      productoProvider.crearProducto(producto);
    else 
      productoProvider.editarProducto(producto);
  
    _mostrarMensaje('Registro guardado');

    Navigator.pop(context);
    // setState(() { _guardando = false; });
  }

  void _mostrarMensaje(String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
      backgroundColor: Colors.deepPurple
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget _mostrarFoto() {
    if(producto.fotoUrl != null) {
      return FadeInImage(
        image: NetworkImage(producto.fotoUrl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else {
      if(foto != null) {
        return Image.file(
          foto,
          height: 300.0,
          fit: BoxFit.cover
        );
      }
      return Image.asset(
        'assets/no-image.png',
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  void _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  void _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  void _procesarImagen(ImageSource origen) async {
    foto = await ImagePicker.pickImage(
      source: origen     
    );

    if(foto != null) {
      producto.fotoUrl = null;
    } 

    setState(() {});
  }
}