import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/kp/dashboardbaru.dart';
import 'package:flutter_baruu/kp/dashboardkp.dart';
import 'package:flutter_baruu/mahasiswa/dashboardjdwlumhs.dart';
import 'package:flutter_baruu/prakp/dashboardpkp.dart';
import 'package:flutter_baruu/suratkp/dashboardsuratkp.dart';
import 'package:flutter_baruu/suratkp/dashboardsuratkp.dart';
import 'package:flutter_baruu/widget/google_signup_button_widget.dart';
import 'package:flutter_baruu/widget/sign_up_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart' show Client;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'provider/google_sign_in.dart';




class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
  void getPkp() async {
    final response = await client.get(_baseUrl + "/sambung/getpkp.php");
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
    getPkp();
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
              /*UserAccountsDrawerHeader(
                accountName: Text("Adrian Stefano and"),
                accountEmail: Text("adrianstefano@mail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "AS",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),*/
              ListTile(
                title: Text("Surat Keterangan Kerja Praktek"),
                trailing: Icon(Icons.mail),
                subtitle: Text("Menu Pengajuan SKKP"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboardSkp(title:"Surat Keterangan KP",))//title: "Pengajuan KP",))
                  ).then(onGoBack);
                }
              ),
              ListTile(
                title: Text("Pra KP"),
                trailing: Icon(Icons.description),
                subtitle: Text("Menu pengajuan Pra KP"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboarPkp(title: "Pra KP",))
                  ).then(onGoBack);
                },
              ),
              ListTile(
                title: Text("Kerja Praktek "),
                trailing: Icon(Icons.library_books),
                subtitle: Text("Menu Pengajuan KP"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboarKp(title: "Data Kerja Praktek",))
                  ).then(onGoBack);
                },
              ),
              ListTile(
                title: Text("Lihat Jadwal"),
                trailing: Icon(Icons.library_books),
                subtitle: Text("Menu Pengajuan KP"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DashboardJadMhs(title: "Data Jadwal",))
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
                  );
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