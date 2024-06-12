class Pesquisa{
  //campos do documento
  final String uid;
  final String tipo;
  final String titulo;
  final String numero;
  final String descricao;
  final String data;
  final String palavras;

  Pesquisa(this.uid,this.tipo,this.titulo, this.numero, this.descricao, this.data, this.palavras);

  //
  // Transforma um OBJETO em JSON
  //
  Map<String,dynamic> toJson(){
    return <String,dynamic>{
      'uid': uid,
      'tipo' : tipo,
      'titulo': titulo,
      'numero': numero,
      'descricao': descricao,
      'data_publicacao': data,
      'palavras_chave': palavras,
    };
  }

  //
  // Transforma um JSON em OBJETO
  //
  factory Pesquisa.fromJson(Map<String,dynamic> json){
    return Pesquisa(
      json['uid'],
      json['tipo'],
      json['titulo'],
      json['numero'],
      json['descricao'],
      json['data_publicacao'],
      json['palavras_chave'],
      );
  }
}