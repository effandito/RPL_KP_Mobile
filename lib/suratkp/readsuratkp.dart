import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ReadSkp extends StatefulWidget {
  final String title;
  Skkp sk=new Skkp();
  ReadSkp({Key key, @required this.title,@required this.sk}) : super(key: key);
  @override
  _ReadSkpState createState() => _ReadSkpState(title,sk);
}

class _ReadSkpState extends State<ReadSkp> {
  final String title;
  Skkp sk=new Skkp();

  _ReadSkpState(this.title,this.sk);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(this.title)
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Telp Lembaga'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: this.sk.telp_lembaga,
                      hintText: "Telepon Lembaga",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: this.sk.alamat,
                      hintText: "Alamat",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: this.sk.dokumen,
                      hintText: "Dokumen",
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: this.sk.pimpinan,
                      hintText: "Pimpinan",
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: this.sk.fax,
                      hintText: "Fax",
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

