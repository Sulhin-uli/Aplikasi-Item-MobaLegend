import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

String msg = "";

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    checkSession();
    super.initState();
  }

  Future _login() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http
        .post(Uri.parse("https://192.168.0.108/api/login.php"), body: {
      "username": usernameController.text,
      "password": passwordController.text
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Username atau Password Salah";
      });
    } else {
      pref.setString("username", usernameController.text);
      Navigator.pushReplacementNamed(context, '/Home');
      setState(() {});
    }
    return datauser;
  }

  Future<bool> checkSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.get("username") != null) {
      Navigator.pushNamedAndRemoveUntil(context, '/Home', (_) => false);
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Aplikasi Data Item Mobile Legends',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Login'),
                      onPressed: () {
                        _login();
                      },
                    )),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Container(
                    child: Text(msg),
                  ),
                )
              ],
            )));
  }
}
