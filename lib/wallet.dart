import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  Wallet({this.collection});
  final int collection;
  @override
  WalletState createState() => new WalletState();
}

class WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("waste thrown is ${widget.collection}"),
      ),
    );
  }
}
