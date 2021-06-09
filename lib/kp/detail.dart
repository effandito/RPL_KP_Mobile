import 'package:flutter/material.dart';
import 'package:flutter_baruu/kp/editdata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/main.dart';

class Detail extends StatefulWidget {
  final List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url="http://192.168.43.131:8080/rpl1/deleteData.php";
    http.post(url, body: {
      'id_kp': widget.list[widget.index]['id_kp']
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
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['id_kp']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['id_kp'], style: new TextStyle(fontSize: 20.0),),
                new Text("semester : ${widget.list[widget.index]['semester']}", style: new TextStyle(fontSize: 18.0),),
                new Text("tahun_kp : ${widget.list[widget.index]['tahun_kp']}", style: new TextStyle(fontSize: 18.0),),
                new Text("jdl_kp : ${widget.list[widget.index]['jdl_kp']}", style: new TextStyle(fontSize: 18.0),),
                new Text("status : ${widget.list[widget.index]['status']}", style: new TextStyle(fontSize: 18.0),),
                new Text("sks : ${widget.list[widget.index]['sks']}", style: new TextStyle(fontSize: 18.0),),
                new Text("nim : ${widget.list[widget.index]['nim']}", style: new TextStyle(fontSize: 18.0),),
                new Text("nik : ${widget.list[widget.index]['nik']}", style: new TextStyle(fontSize: 18.0),),
                new Text("tool : ${widget.list[widget.index]['tool']}", style: new TextStyle(fontSize: 18.0),),
                new Text("spek : ${widget.list[widget.index]['spek']}", style: new TextStyle(fontSize: 18.0),),
                new Text("dokumen : ${widget.list[widget.index]['dokumen']}", style: new TextStyle(fontSize: 18.0),),
                new Text("penguji : ${widget.list[widget.index]['penguji']}", style: new TextStyle(fontSize: 18.0),),
                new Text("ruangan : ${widget.list[widget.index]['ruangan']}", style: new TextStyle(fontSize: 18.0),),
                new Text("lembaga: ${widget.list[widget.index]['lembaga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("pimpinan : ${widget.list[widget.index]['pimpinan']}", style: new TextStyle(fontSize: 18.0),),
                new Text("telp_lembaga : ${widget.list[widget.index]['telp_lembaga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("wkt_pel_kp : ${widget.list[widget.index]['wkt_pel_kp']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
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