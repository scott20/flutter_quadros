class LoginService {
  static final listaUsuarios = [
    {'usuario': "usr1", 'senha': "12345"},
    {'usuario': "usr2", 'senha': "12345"},
    {'usuario': "usr3", 'senha': "12345"},
    {'usuario': "usr4", 'senha': "12345"},
    {'usuario': "adm", 'senha': "12345"}
  ];
  static bool validarLogin(String usuario, String senha) {
    var usuarioEncontrado = listaUsuarios.firstWhere(
        (user) => user['usuario'] == usuario && user[senha] == senha,
        orElse: () => {});
    return usuarioEncontrado.isNotEmpty;
  }
}