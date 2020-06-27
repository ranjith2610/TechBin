import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:tech_bin/root_page.dart';

import 'RouteObserver.dart';
import 'auth.dart';
import 'root_page.dart';
import 'welcom_page.dart';



void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return new MaterialApp(
      title: 'TechBin',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
       
        
            
     
    
     navigatorObservers: <NavigatorObserver>[
        MyRouteObserver(), // this will listen all changes
      ],
      routes: {
        '/': (context) {
          
          return Welcome();
        },
        '/RootPage': (context) {
          return  RootPage(
         
         auth:new Auth(),
          st: 'Register',
        );
        },
       
        
      }
    );
  }
}