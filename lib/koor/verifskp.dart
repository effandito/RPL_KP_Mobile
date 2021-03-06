import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class VerifSkp extends StatefulWidget {
  final String title;
  Skkp sk=new Skkp();
  VerifSkp({Key key, @required this.title,this.sk}) : super(key: key);

  @override
  _VerifSkpState createState() => _VerifSkpState(title,sk);
}

class _VerifSkpState extends State<VerifSkp> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  Skkp sk=new Skkp();


  _VerifSkpState(this.title,this.sk);

  bool _isLoading = false;




  @override
  Widget build(BuildContext context) {
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
                          labelText: "Status Surat KP",
                          hintText: "Belum Diverif, Diverifikasi , Tolak",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                        ),
                        onSaved: (String value) {
                          this.sk.status_skp = value;
                        },
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
                                      child: Text("NO")
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
}
