import 'package:flutter/material.dart';

import 'entry.dart';
import 'login_page.dart';

import 'auth.dart';

enum AuthStatus {
  notSignedIn,
  signedIn,
}
 AuthStatus authStatus = AuthStatus.notSignedIn;
class RootPage extends StatefulWidget {
  RootPage({Key key, this.auth,this.st}) : super(key: key);
  final BaseAuth auth;
   final String st;
  
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}




class _RootPageState extends State<RootPage> {
 
 

  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus = userId != null ? AuthStatus.signedIn : AuthStatus.notSignedIn;
      });
    });
  }

  void _updateAuthStatus(AuthStatus status) {
    setState(() {
      authStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPage(
          title: ' Login',
          auth: widget.auth,
          onSignIn: () => _updateAuthStatus(AuthStatus.signedIn),
          type: widget.st,
        );
      case AuthStatus.signedIn:{

        return new EntryPage(
          selectedIndex:0,
          auth: widget.auth,
          onSignOut: () => _updateAuthStatus(AuthStatus.notSignedIn)
          
        );
        
    }
    }
    
  }
}