import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/koor/dashboardbuatjadwal.dart';
import 'package:flutter_baruu/koor/dashboardverifkp.dart';
import 'package:flutter_baruu/koor/dashboardverifpkp.dart';
import 'package:flutter_baruu/koor/dashboardverifskp.dart';
import 'package:flutter_baruu/kp/dashboardbaru.dart';
import 'package:flutter_baruu/kp/dashboardkp.dart';
import 'package:flutter_baruu/widget/google_signup_button_widget.dart';
import 'package:flutter_baruu/widget/sign_up_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart' show Client;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'provider/google_sign_in.dart';




class DashboardKoor extends StatefulWidget {
  DashboardKoor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardKoorState createState() => _DashboardKoorState();
}

class _DashboardKoorState extends State<DashboardKoor> {
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
                  title: Text("Verifikasi Surat Keterangan KP"),
                  trailing: Icon(Icons.domain_verification),
                  subtitle: Text("Menu Verifikasi SKKP"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DashboarVerSkp())//title: "Pengajuan KP",))
                    ).then(onGoBack);
                  }
              ),
              ListTile(
                title: Text("Verifikasi Pra KP"),
                trailing: Icon(Icons.domain_verification),
                subtitle: Text("Menu Verifikasi Pra KP"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboarVerPkp(title: "Pra KP",))
                  ).then(onGoBack);
                },
              ),
              ListTile(
                title: Text("Verifikasi Kerja Praktek "),
                trailing: Icon(Icons.domain_verification),
                subtitle: Text("Menu Verifikasi KP"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboarVerKp(title: "Data Pra KP",))
                  ).then(onGoBack);
                },
              ),
              ListTile(
                title: Text("Penjadwalan Ujian"),
                trailing: Icon(Icons.domain_verification),
                subtitle: Text("Menu Penjadwalan"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboardJdwl(title: "Data Jadwal",))
                  ).then(onGoBack);
                },
              ),
              ListTile(
                title: Text("Lihat Daftar Regis"),
                trailing: Icon(Icons.library_books),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboarKp(title: "Data Pra KP",))
                  ).then(onGoBack);
                },
              ),
              ListTile(
                title: Text("Set Batas KP "),
                trailing: Icon(Icons.access_alarm_sharp),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboarKp(title: "Data Pra KP",))
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
              /*ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
                subtitle: Text("Menu CRUD Data Mahasiswa"),
                onTap: () async {
                  SharedPreferences pref = await SharedPreferences
                      .getInstance();
                  await pref.setInt("is_logged", 0);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage(title: "wow",))
                  );
                },
              ),*/
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