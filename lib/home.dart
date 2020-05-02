import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:passepartout/Message.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var messages = const [];

  void initState() {
    loadMessageList();
    super.initState();
  }

  Future loadMessageList() async {
    String content = await rootBundle.loadString('data/messages.json');
    List<Messages> collection = json.decode(content);
    //request and get
    setState(() {
      messages = collection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          //Listview dynamic
          separatorBuilder: (context, index) => Divider(),
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            var message = messages[index];
            return ListTile(
              //trailing: Text('Z'),
              isThreeLine: true,
              //mettre un avatar au debut
              leading: CircleAvatar(
                child: Text('VK'),
              ),
              title: Text(message['subjet']),
              subtitle: Text(
                message['body'],
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
    );
  }
}
