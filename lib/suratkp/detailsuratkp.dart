import 'package:flutter/material.dart';
import 'package:flutter_baruu/suratkp/editsuratkp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/main.dart';

class detailSkp extends StatefulWidget {
  List list;
  int index;
  detailSkp({this.index,this.list});

  @override
  _detailSkpState createState() => new _detailSkpState();
}

class _detailSkpState extends State<detailSkp> {

  void deleteSkp(){
    var url="http://192.168.43.131:8080/rpl1/deleteskp.php";
    http.post(url, body: {
      'id_skp': widget.list[widget.index]['id_skp']
    });
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are You sure want to delete '${widget.list[widget.index]['nim']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE!",style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteSkp();
            Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=> new Home(),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL",style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
            title: new Text("${widget.list[widget.index]['id_skp']}")),
        body: new Container(
          height: 270.0,
          padding: const EdgeInsets.all(20.0),
          child: new Card(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  new Text(widget.list[widget.index]['id_skp'],
                    style: new TextStyle(fontSize: 20.0),),
                  new Text(
                    "semester : ${widget.list[widget.index]['semester']}",
                    style: new TextStyle(fontSize: 18.0),),
                  new Text(
                    "tahun_kp : ${widget.list[widget.index]['tahun_kp']}",
                    style: new TextStyle(fontSize: 18.0),),
                  new Text("nim : ${widget.list[widget.index]['nim']}",
                    style: new TextStyle(fontSize: 18.0),),
                  new Text("dokumen : ${widget.list[widget.index]['dokumen']}",
                    style: new TextStyle(fontSize: 18.0),),
                  new Text("lembaga: ${widget.list[widget.index]['lembaga']}",
                    style: new TextStyle(fontSize: 18.0),),
                  new Text("alamat: ${widget.list[widget.index]['alamat']}",
                    style: new TextStyle(fontSize: 18.0),),
                  new Text("fax : ${widget.list[widget.index]['fax']}",
                    style: new TextStyle(fontSize: 18.0),),
                  new Text("status_skp: ${widget.list[widget.index]['status_skp']}",
                    style: new TextStyle(fontSize: 18.0),),
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new RaisedButton(
                        child: new Text("EDIT"),
                        color: Colors.green,
                        onPressed: () =>
                            Navigator.of(context).push(
                                new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new editSkp(
                                  ), //list: widget.list, index: widget.index,),
                                )
                            ),
                      ),
                      new RaisedButton(
                        child: new Text("DELETE"),
                        color: Colors.red,
                        onPressed: () => confirm(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
