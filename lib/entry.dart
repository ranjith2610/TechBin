import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_bin/wallet.dart';
import 'google_map.dart';
import 'login_page.dart';
import 'about_us.dart';
import 'auth.dart';
import 'help.dart';
import 'home_page.dart';
import 'qr_code_scan.dart';

class EntryPage extends StatefulWidget {
  EntryPage({this.selectedIndex, this.auth,this.onSignOut});
   int selectedIndex;
  final BaseAuth auth;
  final VoidCallback onSignOut;
  
  @override
  _EntryPageState createState() => new _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  
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

    void _googlesignOut() async {
      try {
        await widget.auth.signOutGoogle();
        widget.onSignOut();
      } catch (e) {
        print(e);
      }
    }

    final _widgetOptions = [
      new HomePage(),
      new Chart(
        collection: randomNumber,
      ),
      Center(
        child: Text('Wallet'),
      ),
      Center(
        child: Text('Setting'),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
            OutlineButton(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: new Text('Search DustBin Near Me'),
                  ),
                  Icon(Icons.search),
                ]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoogleMaps(),
                    ),
                  );
                }),
          ],
      ),
      body:  WillPopScope(
       onWillPop: () {
            SystemNavigator.pop();
            return Future.value(true);
          },
          child:Center
          (
          child: _widgetOptions.elementAt(widget.selectedIndex),
        ),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.

          child: Container(
            decoration: BoxDecoration(),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(122, 219, 141, 1.0),
                  ),
                  accountName: Text('Username',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                                blurRadius: 10.0,
                                color: Colors.black38,
                                offset: Offset(2.0, 2.0))
                          ])),
                  accountEmail: Text('useremail@gmail.com',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      )),
                  currentAccountPicture: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("lib/image/g.png"),
                  ),
                ),
                ListTile(
                  title: new Row(children: [
                    Icon(
                      Icons.notifications_none,
                      color: Colors.green,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Notificatios',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                    title: new Row(children: [
                      Icon(
                        Icons.history,
                        color: Colors.green,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          'History',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    }),
                ListTile(
                    title: new Row(children: [
                      Icon(
                        Icons.person_outline,
                        color: Colors.green,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    }),
                ListTile(
                    title: new Row(children: [
                      Icon(
                        Icons.help_outline,
                        color: Colors.green,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          'Help & Feedback',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Help(),
                        ),
                      );
                    }),
                ListTile(
                    title: new Row(children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.green,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AbooutUs()),
                      );
                    }),
                ListTile(
                    title: new Row(children: [
                      Icon(
                        Icons.settings,
                        color: Colors.green,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    }),
                ListTile(
                    title: new Row(children: [
                      Icon(
                        Icons.share,
                        color: Colors.green,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          'Share app',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    }),
                ListTile(
                  title: new Row(children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.green,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'logOut',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                  onTap: () {
                    googleSignIn == true ? _googlesignOut() : _signOut();
                  },
                ),
                Container(
                  height: 150,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(100, 50, 120, 0),
                      height: 4,
                      decoration: BoxDecoration(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
       floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.camera_alt),
            label: Text("Scan"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scanner(),
                ),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 20,
      items: [
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
      onTap: (index) {
        setState(() {
          _widgetOptions.elementAt(index);
          widget.selectedIndex = index;
        });
      },
      ),
    );
  }
}
