import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/main.dart';
import 'package:flutter_baruu/model.dart';
import 'package:http/http.dart' as http;

class DashboardDafB extends StatefulWidget {
  DashboardDafB({Key key, this.title}) : super(key: key);


  final String title;
  @override
  _DashboardDafBState createState() => _DashboardDafBState();
}

class _DashboardDafBState extends State<DashboardDafB> {
  final _formkey = GlobalKey<FormState>();

  List<Kp> lDos = new List();

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
        future: ApiServices().getKp(),
        builder: (BuildContext context, AsyncSnapshot<List<Kp>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "something wrong : ${snapshot.error.toString()}"),
            );
          }else if(snapshot.connectionState == ConnectionState.done) {
            lDos = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0,vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(lDos[position].nim),
                        subtitle: Text(lDos[position].jdl_kp),
                        leading: CircleAvatar(
                          //backgroundImage: NetworkImage(user.photoURL),
                        ),
                        /*onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            //MaterialPageRoute(builder: (context) => new (title :"Read Surat KP")),
                              MaterialPageRoute(builder: (context) =>()),
                          );
                        },*/
                      ),
                    )
                );
              },
              itemCount: lDos.length,
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
