import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  Wallet({this.collection});
  int collection;
  @override
  WalletState createState() => new WalletState();
}

class WalletState extends State<Wallet> {
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
