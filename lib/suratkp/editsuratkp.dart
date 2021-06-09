import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  class editSkp extends StatefulWidget {
  final String title;
  Skkp sk=new Skkp();
  editSkp({Key key, @required this.title,this.sk}) : super(key: key);

  @override
  _editSkpState createState() => _editSkpState(title,sk);
}

class _editSkpState extends State<editSkp> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  Skkp sk=new Skkp();


  _editSkpState(this.title,this.sk);

  bool _isLoading = false;


  Future<void> _pickImage(ImageSource source) async {


    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: new AppBar(
            title: new Text("Surat KP")
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Form(
                  key: _formState,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "NIM",
                          hintText: "NIM",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                        ),
                        onSaved: (String value) {
                          this.sk.nim = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(),
                          labelText: "Tahun KP",
                          hintText: "2021",
                        ),
                        onSaved: (String value) {
                          this.sk.tahun_kp = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(),
                          labelText: "Alamat",
                          hintText: "Alamat",
                        ),
                        onSaved: (String value) {
                          this.sk.alamat = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(),
                          labelText: "Dokumen",
                          hintText: "Dokumen",
                        ),
                        onSaved: (String value) {
                          this.sk.dokumen = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(),
                          labelText: "Lembaga",
                          hintText: "Lembaga",
                        ),
                        onSaved: (String value) {
                          this.sk.lembaga = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(),
                          labelText: "Pimpinan",
                          hintText: "Pimpinan",
                        ),
                        onSaved: (String value) {
                          this.sk.pimpinan = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(),
                          labelText: "No Telepon Lembaga",
                          hintText: "08xxxxx",
                        ),
                        onSaved: (String value) {
                          this.sk.telp_lembaga = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(),
                          labelText: "Fax",
                          hintText: "08xxxxx",
                        ),
                        onSaved: (String value) {
                          this.sk.fax = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      /*TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(),
                          labelText: "Waktu Pelaksanaan",
                          hintText: "DD/MM/YYYY",
                        ),
                        onSaved: (String value) {
                          this.mhs.wkt_pel_kp = value;
                        },
                      ),*/
                      SizedBox(
                        height: 15,
                      ),

                      MaterialButton(
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.blue,
                        //onPressed: () {
                          //_pickImage(ImageSource.gallery);
                        //},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.image, color: Colors.white,),
                            Text("Upload",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.blue,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Simpan"),
                                content: Text("Apakah akan disimpan ?"),
                                actions: <Widget>[
                                 /* FlatButton(
                                      onPressed: () async {
                                        _formState.currentState.save();
                                        setState(() => _isLoading = true);
                                        //this.mhs.nim_progmob = "72180262";
                                        List<int> imagesBytes = _imageFile
                                            .readAsBytesSync();
                                        //this.mhs.foto =
                                            base64Encode(imagesBytes);
                                        ApiServices().//updateMhsWithFoto(
                                        (
                                        this.mhs,
                                          _imageFile,
                                          nimcari,
                                        ).then((isSuccess) {
                                          setState(() => _isLoading = false);
                                          if (isSuccess) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: Text("yes")
                                  ),*/
                                  FlatButton(
                                  onPressed: () {
                                    _formState.currentState.save();
                                    ApiServices().updateSkkp(this.sk);
                                  Navigator.pop(context);
                                   },
                                     child: Text("YES")),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("no")
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Text("simpan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _isLoading
                    ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                )
                    : Container(),
              ],
            ),
          ),
        ),
      );
    }
  }
