import 'dart:convert';
import 'package:aplikasi_data_item_mobile_legends/rinci.dart';
import 'package:aplikasi_data_item_mobile_legends/tambah.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class DataItem extends StatefulWidget {
  @override
  _DataItemState createState() => _DataItemState();
}

class _DataItemState extends State<DataItem> {
  Future<List> getData() async {
    final response =
        await http.get(Uri.parse("http://192.168.0.108/api/data_item.php"));
    return json.decode(response.body);
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Apakah akan Logout?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Batal", style: new TextStyle(color: Colors.black)),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        new RaisedButton(
          child: new Text(
            "Ya",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            logout();
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  Future<void> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("username");
    Navigator.pushNamedAndRemoveUntil(context, '/Login', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text("Data Item"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => confirm(),
          )
        ],
        backgroundColor: Colors.green,
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.green,
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Tambah(),
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Rinci(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['name']),
                subtitle: new Text("Type ${list[i]['type']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
