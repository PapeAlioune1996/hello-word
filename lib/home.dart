import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  var messages=const [
    'Que sais tu de volkeno'
    ,'Une initiative tres professionnel'
    ,'Mon premier projet flutter'
    ,'Merci volkeno'
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
          var title=messages[index];
          return ListTile(
            //a la fin

            
            //trailing: Text('Z'),
            isThreeLine: true,
            //mettre un avatar au debut
            leading: CircleAvatar(
              child:Text('VK'),
            ),
            title: Text(title),
            subtitle: Text('Another Text'),
          );
        }
        
        ),
    );
  }
}