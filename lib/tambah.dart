import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Tambah extends StatefulWidget {
  @override
  _TambahState createState() => new _TambahState();
}

class _TambahState extends State<Tambah> {
  TextEditingController controllerName = TextEditingController();

  TextEditingController controllerType = TextEditingController();

  TextEditingController controllereffect = TextEditingController();

  TextEditingController controllerSpecialAttribut = TextEditingController();

  void addData() {
    var url = "http://192.168.0.108/api/tambah.php";

    http.post(Uri.parse(url), body: {
      "name": controllerName.text,
      "type": controllerType.text,
      "effect": controllereffect.text,
      "special_attribut": controllerSpecialAttribut.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Data Item"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerName,
                  decoration:
                      new InputDecoration(hintText: "Name", labelText: "Name"),
                ),
                new TextField(
                  controller: controllerType,
                  decoration:
                      new InputDecoration(hintText: "Type", labelText: "Type"),
                ),
                new TextField(
                  controller: controllereffect,
                  decoration: new InputDecoration(
                      hintText: "Effect", labelText: "Effect"),
                ),
                new TextField(
                  controller: controllerSpecialAttribut,
                  decoration: new InputDecoration(
                      hintText: "Special Attribut",
                      labelText: "Special Attribut"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text(
                    "Tambah Data",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    addData();
                    Navigator.pushReplacementNamed(context, '/Home');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
