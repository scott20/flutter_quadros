import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screens/home_screen.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _controllerUsuario = TextEditingController();
  final _controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context)  {
    
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
              const Text("Usuário: "),
              TextFormField(
                controller: _controllerUsuario,
                maxLength: 18,
              ),
              const Text("Senha: "),
              TextFormField(
                controller: _controllerSenha,
                maxLength: 18,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () => _realizarLogin(context),
                  child: const Text('Realizar Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _realizarLogin(BuildContext context) async {
    String usuario = _controllerUsuario.text;
    String senha = _controllerSenha.text;
    
    final url = Uri.parse('http://localhost:3000/usuarios');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final usuarios = jsonDecode(response.body);
      // print(usuarios);
      var usuarioEncontrado = usuarios.firstWhere(
        (user) => user['usuario'] == usuario && user['senha'] == senha,
        orElse: () => null,
      );

    print(usuarioEncontrado);
      if (usuarioEncontrado != null) {
        // Login bem-sucedido
        if (kDebugMode) {
          print('Login bem-sucedido');
        }

        // Exibe mensagem de sucesso
        _exibirMensagem(context,'Login bem-sucedido');

        // Navega para a tela HomeScreen
        _navegarParaHomeScreen();
      } else {
        // Nome de usuário ou senha inválidos
        if (kDebugMode) {
          print('Nome de usuário ou senha inválidos');
        }

        // Exibe mensagem de erro
        _exibirMensagem(context,'Nome de usuário ou senha inválidos');
      }
    } else {
      // Erro na comunicação com o servidor
      if (kDebugMode) {
        print('Erro na comunicação com o servidor');
      }

      // Exibe mensagem de erro
      _exibirMensagem(context, 'Erro na comunicação com o servidor');
    }
  }

  void _exibirMensagem(BuildContext context, String mensagem) {
    ScaffoldMessengerState scaffoldMessengerState = ScaffoldMessenger.of(context);
    scaffoldMessengerState.showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  void _navegarParaHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}