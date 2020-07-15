import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),

      body: ListView(
        padding: EdgeInsets.all(10.0),//Igual al CSS
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0),
          _cardTipo1(),
          SizedBox(height : 30.0),
          _cardTipo2(),
          SizedBox(height : 30.0)
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    //Creando una tarjeta
    return Card(
      elevation: 10.0,//Altura de la tarjeta con relacion a su sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0) 
      ),//para darle borde
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('En algun lugar de la mancha en la descripcion de la tarjeta para tener una idea'),
            leading: Icon(Icons.photo_album, color: Colors.blue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {

                },
              ),
              
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    //Creando un card 
    final card = Container(
      //clipBehavior: Clip.antiAlias,//Sirve para hacer que nada se salga de la tarjeta
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://www.lukas-petereit.com/wp-content/uploads/2018/08/Sunset-at-Verdon-Canyon-Landscape-of-Provence-Photography-in-France.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'), //Para colocar el placeholder 
            fadeInDuration: Duration(milliseconds: 250),//Tiempo para desaparacer el placeholder
            height: 300.0,
            fit: BoxFit.cover,
          ),

          /*Image(//Para colocar una imagen desde una url
            image: NetworkImage('https://www.lukas-petereit.com/wp-content/uploads/2018/08/Sunset-at-Verdon-Canyon-Landscape-of-Provence-Photography-in-France.jpg'),
          ),*/

          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Texto de prueba')
          ),
        ],
      )
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        //color: Colors.white,

         boxShadow: <BoxShadow>[
           BoxShadow(
             color: Colors.black26,
             blurRadius: 10.0,
             spreadRadius: 2.0,
             offset: Offset(2.0, 10.0)
           )
         ]     
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );
  }
}