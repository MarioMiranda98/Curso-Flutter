import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estilosubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto()
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage('https://iso.500px.com/wp-content/uploads/2017/10/PhotographingTwilight_TannerWendellStewart-218136823.jpg'),
    );
  }

  Widget _crearTitulo() {
    return  SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Montañas y lago', style: estiloTitulo),
                  SizedBox(height: 7.0),
                  Text('Un lago y una montaña', style: estilosubTitulo),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0
            ),
            Text(
              '41',
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'Call'),
        _accion(Icons.near_me, 'Route'),
        _accion(Icons.share, 'Share')    
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 40.0 ),
        SizedBox(height: 5.0),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue))
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Quis mollit aliqua ipsum proident dolor nostrud Lorem adipisicing elit. Sunt ipsum cillum amet cillum. Occaecat adipisicing occaecat irure et deserunt reprehenderit. Magna Lorem aute veniam ad est esse eiusmod excepteur ut amet. Cillum est aliqua in nulla est.',
          textAlign: TextAlign.justify,
          )
        ),
    );
  }
}