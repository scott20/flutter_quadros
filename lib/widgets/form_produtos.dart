import 'package:flutter/material.dart';

class FormProdutos extends StatelessWidget {
  const FormProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Colors.blue.shade500,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      margin: const EdgeInsets.all(4.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("ID: "),
              TextFormField(
                maxLength: 10,
              ),
              const Text("NOME: "),
              TextFormField(
                maxLength: 40,
              ),
              const Text("PREÇO: "),
              TextFormField(
                maxLength: 20,
                keyboardType: TextInputType.number,
              ),
              Center(
                child: ElevatedButton(
                  // ignore: sort_child_properties_last
                  child: const Text('Salvar'),
                  onPressed: _salvar,
                  onLongPress: () => _tratarLong('Tratando long..'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _salvar() {
    // ignore: avoid_print
    print('Salvando Produto');
  }

  void _tratarLong(texto) {
    // ignore: avoid_print
    print(texto);
  }
}