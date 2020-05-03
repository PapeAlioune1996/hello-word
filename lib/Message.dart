import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'Message.g.dart';

@JsonSerializable()
class Messages{
  final String subjet;
  final String body;

  Messages(this.subjet, this.body);

  //creer un autre constructeur
  factory Messages.fromJson(Map<String,dynamic> json) =>
     _$MessagesFromJson(json);

   static Future<List<Messages>> browse() async
   {
     
    //String content = await rootBundle.loadString('data/messages.json');
    http.Response response =
        await http.get('http://www.mocky.io/v2/5eaf25173300008f129f433f');
         
         //une pause de 3 secondes avant que les messages apparaissent
         await Future.delayed(Duration(seconds: 3));
      
    String content = response.body;

    List collection = json.decode(content);
    List<Messages> _message =
        collection.map((json) => Messages.fromJson(json)).toList();

      return _message;
    //request and get
    /*setState(() {
      messages = _message;
      //si sa persiste
      isLoading=false;
    });*/
  }
   
}