import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class readKp extends StatefulWidget {
  final String title;
  Kp mhs;
  readKp({Key key, @required this.title,@required this.mhs}) : super(key: key);
  @override
  _readKpState createState() => _readKpState(title,mhs);
}

class _readKpState extends State<readKp> {
  final String title;
  Kp mhs;
  _readKpState(this.title,this.mhs);
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
                        hintText: 'NIM'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: this.mhs.nim,
                      hintText: "NIM",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tahun KP'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: this.mhs.tahun_kp,
                      hintText: "Tahun KP",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Spesifikasi'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Dokumen'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: this.mhs.dokumen,
                      hintText: "Dokumen",
                    ),
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

