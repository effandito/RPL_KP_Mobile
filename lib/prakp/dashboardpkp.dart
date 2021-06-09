import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/main.dart';
import 'package:flutter_baruu/model.dart';
import 'package:flutter_baruu/prakp/addprakp.dart';
import 'package:flutter_baruu/prakp/editprakp.dart';
import 'package:flutter_baruu/suratkp/detailsuratkp.dart';




class DashboarPkp extends StatefulWidget {
  DashboarPkp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboarPkpState createState() => _DashboarPkpState();
}

class _DashboarPkpState extends State<DashboarPkp> {
  final _formkey = GlobalKey<FormState>();

  List<Pkp> lMhs = new List();

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
                  MaterialPageRoute(builder: (context) =>AddPkp())//title:"Tambah KP"))
                //MaterialPageRoute(builder: (context) => AddData(title: "Tambah KP",))
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getPkp(),
        builder: (BuildContext context, AsyncSnapshot<List<Pkp>> snapshot){
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
                        title: Text(lMhs[position].tool),
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
                                          MaterialPageRoute(builder: (context) => EditPkp()),//title: "Update KP",mhs: lMhs[position],nimcari: lMhs[position].nim)),
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
                                      onPressed: () async{
                                        ApiServices().deletePkp(lMhs[position].nim);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                    )

                                  ],
                                ),
                              )
                          );
                        },
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => detailSkp()),
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