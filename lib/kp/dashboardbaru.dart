import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/kp/Detail.dart';
import 'package:flutter_baruu/kp/addkp.dart';

/*void main() {
  runApp(new MaterialApp(
    title: "My Store",
    home: new Home(),
  ));
}*/

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => new _HomesState();
}

class _HomesState extends State<Homes> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.43.131:8080/rpl1/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("KPSI"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new AddData(),
            )
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
            list: snapshot.data,
          )
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
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new Detail(list:list , index: i,)
                )
            ),
            child: new Card(

              child: new ListTile(
                title: new Text(list[i]['nim']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Semester : ${list[i]['semester']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}