import 'package:flutter/material.dart';
import 'package:easy_oauth/flutter_auth.dart';
import 'package:easy_oauth/model/config.dart';
import 'package:easy_oauth/oauth.dart';
import 'package:easy_oauth/token.dart';

void main() {
  runApp(FlutterView());
}

class FlutterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy OAuth Example',
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: RaisedButton(
                child: Text("Authorize"),
                onPressed: () => authorize(),
              )
            ),
          ),
        ],
      ),
    );
  }

  authorize() async {
    final OAuth flutterOAuth = FlutterOAuth(
      Config(
        "https://www.github.com/login/oauth/authorize",
        "https://www.github.com/login/oauth/access_token",
        "CLIENT_ID",
        "CLIENT_SECRET",
        "http://localhost:8080",
        "code"
      )
    );

    Token token = await flutterOAuth.performAuthorization();

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Access Token:"),
        content: Text(token.accessToken),
      );
    });
  }
}
