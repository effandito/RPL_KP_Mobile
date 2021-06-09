import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/kp/editdata.dart';
import 'package:flutter_baruu/main.dart';
import 'package:flutter_baruu/model.dart';
import 'package:flutter_baruu/kp/readkp.dart';
import 'package:flutter_baruu/kp/updatekp.dart';
import 'addkp.dart';




class DashboarKp extends StatefulWidget {
  DashboarKp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboarKpState createState() => _DashboarKpState();
}

class _DashboarKpState extends State<DashboarKp> {
  final _formkey = GlobalKey<FormState>();

  List<Kp> lMhs = new List();

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
                 MaterialPageRoute(builder: (context) =>AddData())//title:"Tambah KP"))
                 //MaterialPageRoute(builder: (context) => AddData(title: "Tambah KP",))
              ).then(onGoBack);
            },
          ),
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
            lMhs = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0,vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(lMhs[position].jdl_kp),
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
                                          MaterialPageRoute(builder: (context) => EditData()),//title:"Update KP")),
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
                                        ApiServices().deleteKp(lMhs[position].nim);
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
                            MaterialPageRoute(builder: (context) => readKp(title: "Read Matakuliah",mhs: lMhs[position])),
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