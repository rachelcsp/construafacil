class Federais{
  //campos do documento
  final String uid;
  final String titulo;
  final String numero;
  final String palavras;
  final String data;
  final String descricao;
  final String link;


  Federais(this.uid,this.titulo, this.numero,this.palavras,this.data,this.descricao, this.link);

  //
  // Transforma um OBJETO em JSON
  //
  Map<String,dynamic> toJson(){
    return <String,dynamic>{
      'uid': uid,
      'titulo': titulo,
      'numero': numero,
      'palavras_chave': palavras,
      'data_publicacao': data,
      'descricao': descricao,
      'link' : link, 
    };
  }

  //
  // Transforma um JSON em OBJETO
  //
  factory Federais.fromJson(Map<String,dynamic> json){
    return Federais(
      json['uid'],
      json['titulo'],
      json['numero'],
      json['palavras_chave'],
      json['data_publicacao'],
      json['descricao'],
      json['link'],
      );
  }
}