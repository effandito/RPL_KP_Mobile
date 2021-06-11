import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/main.dart';
import 'package:flutter_baruu/model.dart';
import 'package:http/http.dart' as http;

class DashboardJadMhs extends StatefulWidget {
  DashboardJadMhs({Key key, this.title}) : super(key: key);


  final String title;
  @override
  _DashboardJadMhsState createState() => _DashboardJadMhsState();
}

class _DashboardJadMhsState extends State<DashboardJadMhs> {
  final _formkey = GlobalKey<FormState>();

  List<Ukp> lMhs = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getJadwal(),
        builder: (BuildContext context, AsyncSnapshot<List<Ukp>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "something wrong : ${snapshot.error.toString()}"),
            );
          }else if(snapshot.connectionState == ConnectionState.done) {
            lMhs = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0,vertical: 1.0),
                    child: Container(
                        child: ListTile(
                          title: Text(lMhs[position].jdwl_ujian),
                          subtitle: Text(lMhs[position].ruangan),
                          leading: CircleAvatar(
                          ),
                        )
                    ));
              },
              itemCount: lMhs.length,
            );
          } else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
