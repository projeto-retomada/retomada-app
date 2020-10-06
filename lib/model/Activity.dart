class Activity {
  int idAtividade;
  String criacao;
  String ultimaAtualizacao;
  String dataInicio;
  String dataEncerramento;
  String descricao;
  String metadata;
  int idCriterioSanitario;
  int idLocal;

  Activity(
      {this.idAtividade,
      this.criacao,
      this.ultimaAtualizacao,
      this.dataInicio,
      this.dataEncerramento,
      this.descricao,
      this.metadata,
      this.idCriterioSanitario,
      this.idLocal});

  Activity.fromJson(Map<String, dynamic> json) {
    idAtividade = json['id_atividade'];
    criacao = json['criacao'];
    ultimaAtualizacao = json['ultima_atualizacao'];
    dataInicio = json['data_inicio'];
    dataEncerramento = json['data_encerramento'];
    descricao = json['descricao'];
    metadata = json['metadata'];
    idCriterioSanitario = json['id_criterio_sanitario'];
    idLocal = json['id_local'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_atividade'] = this.idAtividade;
    data['criacao'] = this.criacao;
    data['ultima_atualizacao'] = this.ultimaAtualizacao;
    data['data_inicio'] = this.dataInicio;
    data['data_encerramento'] = this.dataEncerramento;
    data['descricao'] = this.descricao;
    data['metadata'] = this.metadata;
    data['id_criterio_sanitario'] = this.idCriterioSanitario;
    data['id_local'] = this.idLocal;
    return data;
  }
}
