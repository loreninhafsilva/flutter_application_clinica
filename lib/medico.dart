class Medico {
  //atributos
  String _nome = "";
  int _crm = 0;
  List<bool> _formacao = [];
  bool _notificacoes = false;

  //construtores
  Medico(this._nome, this._crm, this._formacao, this._notificacoes);

  //getters and setters
  get nome => this._nome;

  set nome( value) => this._nome = value;

  get CRM => this._crm;

  set CRM( value) => this._crm = value;

  get formacao => this._formacao;

  set formacao( value) => this._formacao = value;

  get notificacoes => this._notificacoes;

  set notificacoes( value) => this._notificacoes = value;

}