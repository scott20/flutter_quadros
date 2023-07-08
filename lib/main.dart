import 'package:flutter/material.dart';
import 'package:flutter_login/model/quadro.dart';
import 'package:flutter_login/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final List<Quadro> listaQuadros = [
    Quadro('Quadro 1', 'images/quadro1.jpg'),
    Quadro('Quadro 2', 'images/quadro2.jpg'),
    Quadro('Quadro 3', 'images/quadro3.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Quadro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home('Cadastro de Produtos'),
    );
  }
}