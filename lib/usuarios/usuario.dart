import '../services/usuarioService.dart';

class Usuario {
  int id;
  String nome;
  String cpf_cnpj;
  String grupo_risco;
  String imune;
  String metadata;
  String tipo_usuario;
  int id_instituicao;

  setUsuarioApi(int id) {
    this.id = id;
    Map<String, dynamic> userMap = getUsers(userId: this.id);
    this.nome = userMap['nome'];
    this.cpf_cnpj = userMap['cpf_cnpj'];
    this.grupo_risco = userMap['grupo_risco'];
    this.imune = userMap['imune'];
    this.metadata = userMap['metadata'];
    this.tipo_usuario = userMap['tipo_usuario'];
    this.id_instituicao = userMap['id_instituicao'];
  }
}
