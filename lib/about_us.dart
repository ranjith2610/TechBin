import 'package:flutter/material.dart';


class AbooutUs extends StatefulWidget{

  @override
  _Information createState()=>_Information();
  }
  
  class _Information extends State<AbooutUs>{
    
    Widget build(BuildContext context){
      return Scaffold(
        body:Text('About US',style:TextStyle(fontSize:20),)
      );
    }
}