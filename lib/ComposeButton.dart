import 'package:flutter/material.dart';
import 'package:passepartout/MessageComposed.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add), 
        onPressed: () async{
          String intent= await Navigator.push(context,
           MaterialPageRoute(builder: (BuildContext context) => MessageCompose(),));
                 
                 Scaffold.of(context).showSnackBar(SnackBar(content:Text("Message sent with {$intent}"),),);
             
        },
        );
  }
}