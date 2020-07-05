import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:tech_bin/loader.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => new _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String result = "";

  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      print("reslut $qrResult");
      setState(() {
        result = qrResult.rawContent;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown $ex";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Qr code Scanning'),
            ),
            body: Center(
              child: Text(
                result,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
  }
}
