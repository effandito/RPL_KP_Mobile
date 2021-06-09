import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/dosen/dashboardjdwlujiand.dart';
import 'package:flutter_baruu/kp/dashboardbaru.dart';
import 'package:flutter_baruu/kp/dashboardkp.dart';
import 'package:flutter_baruu/dosen/dashboardaftarbimb.dart';
import 'package:flutter_baruu/widget/google_signup_button_widget.dart';
import 'package:flutter_baruu/widget/sign_up_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart' show Client;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'provider/google_sign_in.dart';




class DashboardDos extends StatefulWidget {
  DashboardDos({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDosState createState() => _DashboardDosState();
}

class _DashboardDosState extends State<DashboardDos> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  String _baseUrl = "https://192.168.43.131:8080/rpl1.php";
  Client client = Client();
  String nim;

  //List<dynamic> _datados = new List();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void getSkkp() async {
    final response = await client.get(_baseUrl + "/sambung/getdata.php");
    var listSkkp = jsonDecode(response.body);
    //String mhs = listDatados['mahasiswa'];
    //String dos = listDatados['dosen'];
    //String mtk = listDatados['matakuliah'];
    // String jdw = listDatados['jadwal'];
    String nim = listSkkp['nim'];
    setState(() {

    });
    //this.mhs=mhs;
    // this.dos=dos;
    //this.mtk=mtk;
    this.nim=nim;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSkkp();
  }

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text("List Daftar Bimbing"),
                  trailing: Icon(Icons.domain_verification),
                  subtitle: Text("Menu View Daftar Bimbing"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DashboardDafB())//title: "Pengajuan KP",))
                    ).then(onGoBack);
                  }
              ),
              ListTile(
                  title: Text("Lihat Jadwal Ujian"),
                  trailing: Icon(Icons.domain_verification),
                  subtitle: Text("Menu View Jadwal Ujian"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DashboardJadDos())//title: "Pengajuan KP",))
                    ).then(onGoBack);
                  }
              ),
              ListTile(
                title: Text("Set Pengajuan Ujian KP"),
                trailing: Icon(Icons.domain_verification),
                subtitle: Text("Menu Verifikasi Pra KP"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboarKp(title: "Pra KP",))
                  ).then(onGoBack);
                },
              ),

              Divider(
                color: Colors.black,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
                subtitle: Text(""),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          SignUpWidget ())
                  ).then(onGoBack);
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey,
        body: Column(children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" HOME DASHBOARD ", style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )
                    ),),
                    SizedBox(height: 4,),
                    Text("Home", style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        )
                    ),)
                  ],
                ),
                IconButton(
                    alignment: Alignment.topCenter,
                    icon: Icon(Icons.notification_important),
                    iconSize: 24,
                    color: Colors.yellow,
                    onPressed: null
                )
              ],
            ),
          ),
          /*SizedBox(
            height: 40,
          ),*/
          //GridDashboard(mhs,dos,mtk,jdw)

        ],)
    );
  }
}