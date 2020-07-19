import 'package:flutter/material.dart';

import 'entry.dart';
import 'login_page.dart';
import 'munci.dart';
import 'auth.dart';

AuthStatus authStatus = AuthStatus.notSignedIn;

class RootPage extends StatefulWidget {
  RootPage({Key key, this.auth, this.st}) : super(key: key);
  final BaseAuth auth;
  final String st;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
  admin,
}

class _RootPageState extends State<RootPage> {
  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      widget.auth.currentUser().then((email) {
        print(email);
        setState(() {
          if (userId != null) {
            if (email == 'HHYQCalVObTMvVLRDmDTyz3zawu1') {
              authStatus = AuthStatus.signedIn;
            } else {
              authStatus = AuthStatus.admin;
            }
          } else {
            authStatus = AuthStatus.notSignedIn;
          }
        });
      });
    });
  }

  void _updateAuthStatus(AuthStatus status) {
    if (status != AuthStatus.notSignedIn) {
      widget.auth.currentUser().then((email) {
        print(email);
        setState(() {
          email == 'HHYQCalVObTMvVLRDmDTyz3zawu1'
              ? authStatus = AuthStatus.signedIn
              : authStatus = AuthStatus.admin;
        });
      });
    } else {
      setState(() {
        authStatus = AuthStatus.notSignedIn;
      });
      
    }
   
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPage(
          title: ' Login',
          auth: widget.auth,
          type: widget.st,
          onSignIn: () => _updateAuthStatus(AuthStatus.signedIn),
        );
      case AuthStatus.signedIn:
        {
          return new EntryPage(
              selectedIndex: 0,
              auth: widget.auth,
              onSignOut: () => _updateAuthStatus(AuthStatus.notSignedIn));
        }
      case AuthStatus.admin:
        {
          return Munci(
            auth: widget.auth,
              onSignOut: () => _updateAuthStatus(AuthStatus.notSignedIn));
        }
    }
  }
}
