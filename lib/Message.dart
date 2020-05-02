class Messages{
  final String subjet;
  final String body;

  Messages(this.subjet, this.body);

  //creer un autre constructeur
  Messages.fromJson(Map<String,dynamic> json) :
      subjet=json['subjet'],
      body=json['body'];

}