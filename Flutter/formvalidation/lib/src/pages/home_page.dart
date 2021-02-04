import 'package:flutter/material.dart';

import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/producto_provider.dart';
//import 'package:formvalidation/src/blocs/provider.dart';

class HomePage extends StatelessWidget {
  final productoProvider = ProductoProvider();
  
  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productoProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if(snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (BuildContext context, int index) => _crearItem(context, productos[index]),
          );
        } else return Center(child: CircularProgressIndicator());
      }
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion) {
        productoProvider.borrarProducto(producto.id);
      },
      child: Card(
        child: Column(
          children: [
            (producto.fotoUrl == null) ? 
              Image(
                image: AssetImage('assets/no-image.png'),
              )
            :
              FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(producto.fotoUrl),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover
              ),
            ListTile(
              title: Text('${producto.titulo} - ${producto.valor}'),
              subtitle: Text(producto.id),
              onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
            ),
          ],
        ),
      ), 
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add
      ),
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        Navigator.pushNamed(context, 'producto');
      },
    );
  }
}