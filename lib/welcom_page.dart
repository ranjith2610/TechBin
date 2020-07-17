import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';





class Welcome extends StatefulWidget{
 Welcome({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => new _Welcomes();

}
class _Welcomes extends State<Welcome>{

void initState() {
    super.initState();
    navigateToLastPage();
  }

  void navigateToLastPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lastRoute = prefs.getString('last_route');
    if (lastRoute.isNotEmpty && lastRoute != '/') {
      Navigator.of(context).pushNamed(lastRoute);
    }
  }

  
  Widget build(BuildContext context) {
    
    return  new Scaffold(
      
      body: Center(
        child: Container(
        constraints: BoxConstraints.expand(),
            decoration:  BoxDecoration(
            
      image:  DecorationImage(
        image:  AssetImage("lib/image/welcome.jpg"),
        fit: BoxFit.fill
      ),
    ),
            child: new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new PrimaryButton(
                          text: 'Get Started',
                          height: 50.0,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/RootPage');
                          }
                      ),
                    ]
            )
        )
      )
    );
  }
}
