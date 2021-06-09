/*import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/suratkp/editsuratkp.dart';
import 'package:flutter_baruu/main.dart';
import 'package:flutter_baruu/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/suratkp/readsuratkp.dart';



class DashboardJadMhs extends StatefulWidget {
  DashboardJadMhs({Key key, this.title}) : super(key: key);


  final String title;
  @override
  _DashboardJadMhsState createState() => _DashboardSkpState();
}

class _DashboardJadMhsState extends State<DashboardJadMhs> {
  final _formkey = GlobalKey<FormState>();

  List<Ukp> lDos = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

            },
          ),
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
                       title: Text(lDos[position].penguji +"-"+ lDos[position].jdwl_ujian),
                        subtitle: Text(lDos[position].ruangan),
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

                                  ],
                                ),
                              )
                          );
                        },

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
}*/
