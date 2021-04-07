import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class LaunchUrlDemo extends StatefulWidget {
  //
  LaunchUrlDemo({Key key}) : super(key: key);
  final String title = '                              F o t u s';

  @override
  _LaunchUrlDemoState createState() => _LaunchUrlDemoState();
}

class _LaunchUrlDemoState extends State<LaunchUrlDemo> {
  //
  Future<void> _launched;
  String _launchUrl = 'https://www.fotus.net/login-and-signup/';

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: true,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 660.0,
              ),
              //ButtonTheme(
              //minWidth: 100.0,
              //height: 55.0,
              //child: RaisedButton(
              //child: const Text('    Press me to Enter    '),
              //onPressed: () {
              //setState(() {
              //_launched = _launchInApp(_launchUrl);
              //});
              //},
              //color: Colors.black38,
              //textColor: Colors.white,
              //shape: RoundedRectangleBorder(
              //borderRadius: new BorderRadius.circular(10),
              //)),
              //),
              FlatButton(
                child: Text(
                  "    Welcome to Fotus World  ->  ",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _launched = _launchInApp(_launchUrl);
                  });
                },
                padding: EdgeInsets.all(15),
                color: Colors.blueAccent,
                shape: StadiumBorder(),
              ),
              SizedBox(
                height: 20.0,
              ),
              //FutureBuilder(
              //future: _launched,
              //builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              //if (snapshot.hasError) {
              //return Text('Error: ${snapshot.error}');
              //} else {
              //return Text('Launched.');
              //}
              //},
              //),
            ],
          ),
        ),
      ),
    );
  }
}
