import 'package:json_annotation/json_annotation.dart';
part 'Message.g.dart';

@JsonSerializable()
class Messages{
  final String subjet;
  final String body;

  Messages(this.subjet, this.body);

  //creer un autre constructeur
  Messages.fromJson(Map<String,dynamic> json) :
      subjet=json['subjet'],
      body=json['body'];

}