import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth.dart';
import 'package:tech_bin/login_page.dart';



class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
   @override
  _Home createState()=> new _Home();
}
  class _Home extends State<HomePage> {
    
   int _currentIndex=0;
   final tabs=[
     Center(child:Text('Home'),),
     Center(child:Text('Chart'),),
     Center(child:Text('Wallet'),),
     Center(child:Text('Setting'),),
   ];
  Widget build(BuildContext context) {
     void _signOut() async {
      try {
        await widget.auth.signOut();
        widget.onSignOut();
      } catch (e) {
        print(e);
      }
    }

    void _googlesignOut() async {
      try {
        await widget.auth.signOutGoogle();
        widget.onSignOut();
      } catch (e) {
        print(e);
      }

    }
   
    return Scaffold(
      appBar: AppBar(title: Text('techbin'),
     actions: <Widget>[
       IconButton(icon: Icon(Icons.center_focus_weak),
        onPressed: (){
         return AlertDialog(
            title: Text("QR code Scanner"),
            content: Text("scan code"),
          );
        }
       )
     ],
        ),
      body: WillPopScope(
    onWillPop: (){
       SystemNavigator.pop();
      return  Future.value(true);
    },
   
   child:  tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 20,
        
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text('Chart'),
            backgroundColor: Colors.blue,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Wallet'),
            backgroundColor: Colors.blue,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        }, 
        ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text('user name'), accountEmail:Text('useremail@gmail.com'),
            currentAccountPicture:  Image(image: AssetImage("lib/image/google_logo.png"),) ,
            ),
            ListTile(
              title: Text('logOut'),
              onTap: () {
                googleSignIn==true?_googlesignOut():_signOut();
              },
            ),
            ListTile(
              title: Text('About us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }


 /* @override
  Widget build(BuildContext context) {

   

    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text('TECHbin'),
        
      ),
      body: WillPopScope(
    onWillPop: () async => false,
   /* {
       return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm Exit"),
            content: Text("Are you sure you want to exit?"),
            actions: <Widget>[
              FlatButton(
                child: Text("YES"),
                onPressed: () {
                 SystemNavigator.pop();
                 Future.value(true);
                 
                },
              ),
              FlatButton(
                child: Text("NO"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
            )
          ],
        );
      }
    );
    
      },*/
    child:new Center(
        child: new Text(
          'Welcome',
          style: new TextStyle(fontSize: 32.0),
        ),
      )
    )
    );
  }*/

}