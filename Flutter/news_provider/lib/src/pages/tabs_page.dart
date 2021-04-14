import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_provider/src/pages/tab2_page.dart';
import 'package:news_provider/src/pages/tab1_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: SafeArea(
        child: Scaffold(
          body: _Paginas(),
          bottomNavigationBar: _Navegacion()
        ),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (indice) => navegacionModel.paginaActual = indice,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
          ),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.public,
          ),
          label: 'Encabezados',
        ),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      // physics: BouncingScrollPhysics(),
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget> [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;
  PageController get pageController => this._pageController;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    this._pageController.animateToPage(
      valor, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.easeOut
    );
    notifyListeners();
  }
}