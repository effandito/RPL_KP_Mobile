import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/koor/verifskp.dart';
import 'package:flutter_baruu/main.dart';
import 'package:flutter_baruu/model.dart';
import 'package:flutter_baruu/prakp/addprakp.dart';
import 'package:flutter_baruu/prakp/editprakp.dart';
import 'package:flutter_baruu/suratkp/detailsuratkp.dart';

class DashboarVerSkp extends StatefulWidget {
  DashboarVerSkp({Key key, this.title}) : super(key: key);
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  List list;
  int index;

  @override
  _DashboarVerSkpState createState() => _DashboarVerSkpState();
}

class _DashboarVerSkpState extends State<DashboarVerSkp> {
  final _formkey = GlobalKey<FormState>();

  List<Skkp> lMhs = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi Skp'),
       
      ),
      body: FutureBuilder(
        future: ApiServices().getSkkp(),
        builder: (BuildContext context, AsyncSnapshot<List<Skkp>> snapshot){
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
                        title: Text(lMhs[position].nim),
                        subtitle: Text(lMhs[position].tahun_kp),
                        leading: CircleAvatar(
                          //backgroundImage: NetworkImage(user.photoURL),
                        ),
                        onLongPress: (){
                          showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    FlatButton(
                                      child: Text("Update"),
                                      onPressed: (){
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => VerifSkp(sk :lMhs[position])),//title: "Update KP",mhs: lMhs[position],nimcari: lMhs[position].nim)),
                                        ).then(onGoBack);
                                      },
                                    ),
                                  ],
                                ),
                              )
                          );
                        },
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerifSkp(sk :lMhs[position])),
                          );
                        },
                      ),
                    )
                );
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