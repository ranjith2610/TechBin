import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:tech_bin/entry.dart';
import 'package:tech_bin/home_page.dart';
import 'package:tech_bin/loader.dart';
import 'package:tech_bin/chart.dart';
int randomNumber;

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => new _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String result = "h";
  bool loader = true, succes = false;
  Random random = new Random();

  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      print("reslut${qrResult.rawContent}..\n");
      if ((qrResult.type).toString() != 'Cancelled') {
        setState(() {
          result = qrResult.rawContent;
          succes = true;
          randomNumber = random.nextInt(10) + 1;
          print(randomNumber);
          print((qrResult.type).toString());
        });
      } else {
        succes = false;
        print(succes);
        route();
      }
    } catch (ex) {
      setState(() {
        result = "ex";
        succes = false;
      });
    }
    loader = false;
  }

  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    if (succes == true) {
      print(randomNumber);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => EntryPage(
                    selectedIndex: 2,
                  )));
    } else {
      print("home");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EntryPage(
            selectedIndex: 0,
          ),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    switch (loader) {
      case true:
        return Loader();
      case false:
        startTime();
        return Scaffold(
          body: Center(
            child: succes == true
                ? Text(
                    "scan Successfull!!!!!!!!",
                    style: TextStyle(fontSize: 20),
                  )
                : Text(
                    "scan unSuccessfull!!!!!!!!$result",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
        );
    }
  }
}
