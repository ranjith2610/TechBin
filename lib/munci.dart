import 'package:flutter/material.dart';
import 'auth.dart';
class Munci extends StatefulWidget {
  Munci({this.auth, this.onSignOut});
   final BaseAuth auth;
  final VoidCallback onSignOut;
  @override
  _HelpToUser createState() => new _HelpToUser();
}

class _HelpToUser extends State<Munci> {
   
    @override
  Widget build(BuildContext context) {
    void _signOut() async {
      try {
        await widget.auth.signOut();
        widget.onSignOut();
      } catch (e) {
        print(e);
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('munci'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            FloatingActionButton(
                child:new Text('signout'),
                onPressed: () {
                  _signOut();
                }),
          ],
        ),
        body: Text(
          'munuci',
          style: TextStyle(fontSize: 20),
        ));
  }
}
