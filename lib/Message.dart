class Messages{
  final String subjet;
  final String body;

  Messages(this.subjet, this.body);

  //creer un autre constructeur
  Messages.fromJson(Map<dynamic,String> json) :
      subjet=json['subjet'],
      body=json['body'];

}