class Location {
  int id_local;
  String criacao;
  String ultima_atualizacao;
  String descricao;
  String descricao_normalizada;
  int lotacao_maxima;
  String aberto_fechado;
  String metadata;
  int id_instituicao;

  Location(
      {this.id_local,
        this.criacao,
        this.ultima_atualizacao,
        this.descricao,
        this.descricao_normalizada,
        this.lotacao_maxima,
        this.aberto_fechado,
        this.metadata,
        this.id_instituicao});

  Location.fromJson(Map<String, dynamic> json) {
    id_local = json['id_local'];
    criacao = json['criacao'];
    ultima_atualizacao = json['ultima_atualizacao'];
    descricao = json['descricao'];
    descricao_normalizada = json['descricao_normalizada'];
    lotacao_maxima = json['lotacao_maxima'];
    aberto_fechado = json['aberto_fechado'];
    metadata = json['metadata'];
    id_instituicao = json['id_instituicao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_atividade'] = this.id_local;
    data['criacao'] = this.criacao;
    data['ultima_atualizacao'] = this.ultima_atualizacao;
    data['descricao'] = this.descricao;
    data['descricao_normalizada'] = this.descricao_normalizada;
    data['lotacao_maxima'] = this.lotacao_maxima;
    data['aberto_fechado'] = this.aberto_fechado;
    data['metadata'] = this.metadata;
    data['id_instituicao'] = this.id_instituicao;
    return data;
  }
}
