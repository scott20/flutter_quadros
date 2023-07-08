// import 'package:flutter_login/widgets/form_produtos.dart';
import 'package:flutter_login/widgets/form_login.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  String titulo;
  Home(this.titulo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_this
        title: Text(this.titulo),
      ),
      body: FormLogin(),
    );
  }
}