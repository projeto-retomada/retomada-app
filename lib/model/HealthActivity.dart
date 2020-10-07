class HealthActivity {
  int idHealthActivities;
  String data;
  int temperatura;
  String coriza;
  String dificuldadeRespiracao;
  String tosse;
  String cansaco;
  String febre;
  String contatoComExposto;
  int usuarioId;

  HealthActivity(
      {this.idHealthActivities,
        this.data,
        this.temperatura,
        this.coriza,
        this.dificuldadeRespiracao,
        this.tosse,
        this.cansaco,
        this.febre,
        this.contatoComExposto,
        this.usuarioId});

  HealthActivity.fromJson(Map<String, dynamic> json) {
    idHealthActivities = json['id_health_activities'];
    data = json['data'];
    temperatura = json['temperatura'];
    coriza = json['coriza'];
    dificuldadeRespiracao = json['dificuldade_respiracao'];
    tosse = json['tosse'];
    cansaco = json['cansaco'];
    febre = json['febre'];
    contatoComExposto = json['contato_com_exposto'];
    usuarioId = json['usuario_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_health_activities'] = this.idHealthActivities;
    data['data'] = this.data;
    data['temperatura'] = this.temperatura;
    data['coriza'] = this.coriza;
    data['dificuldade_respiracao'] = this.dificuldadeRespiracao;
    data['tosse'] = this.tosse;
    data['cansaco'] = this.cansaco;
    data['febre'] = this.febre;
    data['contato_com_exposto'] = this.contatoComExposto;
    data['usuario_id'] = this.usuarioId;
    return data;
  }
}
