import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class HomePage extends StatefulWidget {
 
  @override
  _Home createState() => new _Home();
  
}

class _Home extends State<HomePage> {
  // Completer<WebViewController> _controller = Completer<WebViewController>();

  
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
            initialUrl: 'https://WWW.indiatoday.in/news.html',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        
       
        );
  }
}


