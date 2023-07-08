import 'package:flutter/material.dart';
import 'package:flutter_login/model/quadro.dart';

class DetailScreen extends StatelessWidget {
  final Quadro quadro;

  DetailScreen(this.quadro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quadro.nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              quadro.imagem,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("Voltar");
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
