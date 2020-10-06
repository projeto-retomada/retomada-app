class LoggedUser {
  static String nome, grupo_risco, imune, metadata, tipo_usuario, email;
  static int id_instituicao, id_usuario;

  setUser(id_usuario_api, nome_api, grupo_risco_api, imune_api, metadata_api,
      tipo_usuario_api, email_api, id_instituicao_api) {
    id_usuario = id_usuario_api;
    nome = nome_api;
    grupo_risco = grupo_risco_api;
    imune = imune_api;
    metadata = metadata_api;
    tipo_usuario = tipo_usuario_api;
    email = email_api;
    id_instituicao = id_instituicao_api;
  }

  String getNome() {
    return nome;
  }
  int getInstituicao() {
    return id_instituicao;
  }
  int getId() {
    return id_usuario;
  }
}