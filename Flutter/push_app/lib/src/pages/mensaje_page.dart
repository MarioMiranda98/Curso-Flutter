import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Push App'),
        ),
        body: Center(
          child: Container(
            child: Text(arg),
          ),
        ),
      ),
    );
  }
}