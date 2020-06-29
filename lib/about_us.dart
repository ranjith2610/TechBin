import 'package:flutter/material.dart';


class AbooutUs extends StatefulWidget{

  @override
  _Information createState()=>new  _Information();
  }
  
  class _Information extends State<AbooutUs>{
    
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('About Us'),),
        body:Text('About US',style:TextStyle(fontSize:20),)
      );
    }
}