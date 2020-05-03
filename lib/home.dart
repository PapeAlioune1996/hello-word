import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:passepartout/Message.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Messages> messages = const [];
  bool isLoading =true;

  void initState() {
    loadMessageList();
    super.initState();
  }

  Future loadMessageList() async {
    //String content = await rootBundle.loadString('data/messages.json');
    http.Response response =
        await http.get('http://www.mocky.io/v2/5eaf0b203300004b009f42e7');
         
         //une pause de 3 secondes avant que les messages apparaissent
         await Future.delayed(Duration(seconds: 3));
      
    String content = response.body;

    List collection = json.decode(content);
    List<Messages> _message =
        collection.map((json) => Messages.fromJson(json)).toList();

    //request and get
    setState(() {
      messages = _message;
      //si sa persiste
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isLoading ? Center(child:CircularProgressIndicator() ,) 
      : ListView.separated(
          //Listview dynamic
          separatorBuilder: (context, index) => Divider(),
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            Messages message = messages[index];
            return ListTile(
              //trailing: Text('Z'),
              isThreeLine: true,
              //mettre un avatar au debut
              leading: CircleAvatar(
                child: Text('VK'),
              ),
              title: Text(message.subjet),
              subtitle: Text(
                message.body,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
    );
  }
}
