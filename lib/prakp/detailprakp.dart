import 'package:flutter/material.dart';
import 'package:flutter_baruu/kp/editdata.dart';
import 'package:flutter_baruu/prakp/editprakp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/main.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url="http://192.168.43.131:8080/rpl1/deletepkp.php";
    http.post(url, body: {
      'id_pkp': widget.list[widget.index]['id_pkp']
    });
  }

  void getPkp(){
    var url="http://192.168.43.131:8080/rpl1/getPkp.php";
    http.post(url, body: {
      'id_pkp': widget.list[widget.index]['id_pkp']
    });
  }

  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are You sure want to delete '${widget.list[widget.index]['item_name']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE!",style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
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
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['id_pkp']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['id_pkp'], style: new TextStyle(fontSize: 20.0),),
                new Text("semester : ${widget.list[widget.index]['semester']}", style: new TextStyle(fontSize: 18.0),),
                new Text("tahun_kp : ${widget.list[widget.index]['tahun_kp']}", style: new TextStyle(fontSize: 18.0),),
                new Text("nim : ${widget.list[widget.index]['nim']}", style: new TextStyle(fontSize: 18.0),),
                new Text("tool : ${widget.list[widget.index]['tool']}", style: new TextStyle(fontSize: 18.0),),
                new Text("spek : ${widget.list[widget.index]['spek']}", style: new TextStyle(fontSize: 18.0),),
                new Text("dokumen : ${widget.list[widget.index]['dokumen']}", style: new TextStyle(fontSize: 18.0),),
                new Text("penguji : ${widget.list[widget.index]['penguji']}", style: new TextStyle(fontSize: 18.0),),
                new Text("ruangan : ${widget.list[widget.index]['ruangan']}", style: new TextStyle(fontSize: 18.0),),
                new Text("lembaga: ${widget.list[widget.index]['lembaga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("pimpinan : ${widget.list[widget.index]['pimpinan']}", style: new TextStyle(fontSize: 18.0),),
                new Text("almat : ${widget.list[widget.index]['alamat']}", style: new TextStyle(fontSize: 18.0),),
                new Text("telp_lembaga : ${widget.list[widget.index]['telp_lembaga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("status_pkp : ${widget.list[widget.index]['status_pkp']}", style: new TextStyle(fontSize: 18.0),),
                new Text("wkt_pel_kp : ${widget.list[widget.index]['wkt_pel_pkp']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context)=>new editPkp(),
                          )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
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