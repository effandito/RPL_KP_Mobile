import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class VerifKp extends StatefulWidget {
  final String title;
  Kp mhs = new Kp();

  VerifKp({Key key, @required this.title}) : super(key: key);

  @override
  _VerifKpState createState() => _VerifKpState(title);
}

class _VerifKpState extends State<VerifKp> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  Kp mhs = new Kp();


  _VerifKpState(this.title);

  bool _isLoading = false;




  @override
  Widget build(BuildContext context) {
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
                Form(
                  key: _formState,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Status KP",
                          hintText: "Belum Diverif, Diverifikasi , Tolak",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                        ),
                        onSaved: (String value) {
                          this.mhs.status_kp = value;
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
}
