import 'package:flutter/material.dart';


class Help extends StatefulWidget{

  @override
  _HelpToUser createState()=>new _HelpToUser();
  }
  
  class _HelpToUser extends State<Help>{
    
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('Help'),),
        body:Text('Help',style:TextStyle(fontSize:20),)
      );
    }
}