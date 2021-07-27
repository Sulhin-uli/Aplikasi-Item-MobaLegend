import 'package:aplikasi_data_item_mobile_legends/edit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Rinci extends StatefulWidget {
  List list;

  int index;

  Rinci({this.index, this.list});

  @override
  _RinciState createState() => new _RinciState();
}

class _RinciState extends State<Rinci> {
  void deleteData() {
    var url = "http://192.168.0.108/api/hapus.php";

    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah akan menghapus data ${widget.list[widget.index]['name']} ?"),
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
            deleteData();

            Navigator.pushReplacementNamed(context, '/Home');
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['name']}"),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              Text(
                "Name : ${widget.list[widget.index]['name']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Type : ${widget.list[widget.index]['type']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Effect : ${widget.list[widget.index]['effect']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Special Attribut : ${widget.list[widget.index]['special_attribut']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("EDIT"),
                    color: Colors.grey,
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Edit(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  new RaisedButton(
                    child: new Text("HAPUS"),
                    color: Colors.red,
                    onPressed: () => confirm(),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
