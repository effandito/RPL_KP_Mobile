import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/suratkp/detailsuratkp.dart';
import 'package:flutter_baruu/suratkp/editsuratkp.dart';
import 'package:flutter_baruu/main.dart';
import 'package:flutter_baruu/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/suratkp/readsuratkp.dart';
import 'addsuratkp.dart';


class DashboardSkp extends StatefulWidget {
  DashboardSkp({Key key, this.title}) : super(key: key);


  final String title;
  @override
  _DashboardSkpState createState() => _DashboardSkpState();
}

class _DashboardSkpState extends State<DashboardSkp> {
  final _formkey = GlobalKey<FormState>();

  List<Skkp> lMhs = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>AddSkp())//title:"Tambah KP"))
                //MaterialPageRoute(builder: (context) => AddData(title: "Tambah KP",))
              ).then(onGoBack);
            },
          ),
        ],
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
                        title: Text(lMhs[position].lembaga),
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
                                          MaterialPageRoute(builder: (context) => new editSkp(sk :lMhs[position])),//title: "Update KP",mhs: lMhs[position],nimcari: lMhs[position].nim)),
                                        ).then(onGoBack);
                                      },
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 20,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    FlatButton(
                                      child: Text("Delete"),
                                      color:Colors.red,
                                      onPressed: () async{
                                        ApiServices().deleteSkkp(lMhs[position].id_skp);
                                        Navigator.pop(context);
                                        setState(() {});
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
                            MaterialPageRoute(builder: (context) => new ReadSkp(title :'surat keterangan',sk :lMhs[position])),
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
