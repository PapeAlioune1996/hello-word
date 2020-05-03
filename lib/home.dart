

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:passepartout/Message.dart';


class Home extends StatefulWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Messages>> messages;
  bool isLoading =true;

  //Future loadMessageList() async {
   //List<Messages> _message=await Messages.browse();
    @override
    void initState() {
    //loadMessageList();
    super.initState();
    messages=Messages.browse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: (){
            var _message=Messages.browse();
            setState(() {
              messages=_message;
            });
          })
        ],
      ),
      body: FutureBuilder(
        future: messages,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

         switch(snapshot.connectionState)
         {
           case ConnectionState.none:
           case ConnectionState.waiting:
           case ConnectionState.active:
           return Center(child:CircularProgressIndicator(),);
           case ConnectionState.done:
           if(snapshot.error)
           return Text("Erreur : {$snapshot.error}");
           var messages=snapshot.data;
           return
            ListView.separated(
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
          });
         }
        },
        
      )
      //isLoading ? Center(child:CircularProgressIndicator() ,) 
      //  
    );
  }
}
