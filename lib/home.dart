import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  var messages=const [
    {
      'subjet':'Que savez vous de volkeno?',
      'body':'volkeno c est une organ'
    },
    {
      'subjet':'',
      'body':''
    },
    {
      'subjet':'',
      'body':''
    },
    {
      'subjet':'',
      'body':''
    },{
      'subjet':'',
      'body':''
    }
  ];

    return Scaffold(
      appBar: AppBar(
        
        title: Text(title
        ),
      ),

      body:ListView.separated(
        //Listview dynamic
       separatorBuilder: (context,index)=>Divider(),
        itemCount:messages.length,
        itemBuilder:(BuildContext context,int index)
        {
          var message=messages[index];
          return ListTile(
            //a la fin

            
            //trailing: Text('Z'),
            isThreeLine: true,
            //mettre un avatar au debut
            leading: CircleAvatar(
              child:Text('VK'),
            ),
            title: Text(message['subjet']),
            subtitle: Text(message['body']),
          );
        }
        
        ),
    );
  }
}