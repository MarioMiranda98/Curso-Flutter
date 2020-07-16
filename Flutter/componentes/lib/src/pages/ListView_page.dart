import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  @override
  void initState() {//Para ejecutar codigo en el instante que se crea el statefulWidget
    super.initState();
    _agregarDiez();
    _scrollController.addListener(() {
      //print("Scroll");
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_agregarDiez();
        _fetchData();
      }
    });//Esto se dispara cada vez que se mueve el scroll
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),

      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
          ]
      )
    );
  }

  @override 
  void dispose() {//Se dispara cuando llega al final
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,//Par hacer el refresh
      child: ListView.builder( //Hace que se rendericen los elementos
        controller: _scrollController,//Asignando el scrollcontroler
        itemCount: _listaNumeros.length,//numero de elementos a construir
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },//Se encarga de dibujar el widget
      ),
    );
  }

  void _agregarDiez() {
    for(int i = 1; i <= 10; i++) {
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);
    }

    setState(() {
      
    });
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() { });

    final Duration duration = new Duration(seconds : 2); 
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregarDiez();
  }

  Widget _crearLoading() {
    if(_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
              ]
          ),
          SizedBox(height: 15.0)
        ]
      );
    } else {
      return Container();
    }
  }

  Future<Null> _obtenerPagina1() async {
    final Duration duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoNumero++;
      _agregarDiez();
    });

    return Future.delayed(duration);
  }  

  List<int> _listaNumeros = new List();
  int _ultimoNumero = 0;
  ScrollController _scrollController = new ScrollController();//Permite controlar un scroll
  bool _isLoading = false;
  
}