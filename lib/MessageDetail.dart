import 'package:flutter/material.dart';

class MessageDetails extends StatelessWidget {
  final String subjet;
  final String body;
  MessageDetails( this.subjet, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   title: Text(this.subjet),
    ),
    body:  Container(
      padding: EdgeInsets.all(16),
      child: Text(this.body),
    ),
    );
    
   
  }
}