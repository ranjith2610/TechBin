import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  Chart({this.collection});
  int collection;
  @override
  ChartState createState() => new ChartState();
}

class ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    widget.collection == null ? widget.collection = 0 : null;
    return Scaffold(
     
      body: Center(
        child: Text("waste thrown is ${widget.collection} kg"),
      ),
    );
  }
}
