import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  final List list;

  final int index;

  Edit({this.list, this.index});

  @override
  _EditState createState() => new _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController controllerName;

  TextEditingController controllerType;

  TextEditingController controllerEffect;

  TextEditingController controllerSpecialAttribut;

  void editData() {
    var url = "http://192.168.0.108/api/edit.php";

    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "name": controllerName.text,
      "type": controllerType.text,
      "effect": controllerEffect.text,
      "special_attribut": controllerSpecialAttribut.text,
    });
  }

  @override
  void initState() {
    controllerName =
        new TextEditingController(text: widget.list[widget.index]['name']);

    controllerType =
        new TextEditingController(text: widget.list[widget.index]['type']);

    controllerEffect =
        new TextEditingController(text: widget.list[widget.index]['effect']);

    controllerSpecialAttribut = new TextEditingController(
        text: widget.list[widget.index]['special_attribut']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA ITEM"),
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
                  controller: controllerEffect,
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
                  child: new Text("Edit"),
                  color: Colors.grey,
                  onPressed: () {
                    editData();
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
