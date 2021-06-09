import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/model.dart';
import 'package:http/http.dart' as http;

class AddJad extends StatefulWidget {
  @override
  _AddJadState createState() => _AddJadState();
}

class _AddJadState extends State<AddJad> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Ukp uk= new Ukp();
  TextEditingController controllerIdUjian = new TextEditingController();
  TextEditingController controllerTahunUkp = new TextEditingController();
  TextEditingController controllerRuangan = new TextEditingController();
  TextEditingController controllerPenguji = new TextEditingController();
  TextEditingController controllerJadwalUji = new TextEditingController();
  TextEditingController controllerStatusUji = new TextEditingController();


  void addJad() {
    var url = "http://192.168.43.131:8080/sambung/addjadwal.php";

    http.post(url, body: {
      "id_ujian":  controllerIdUjian.text,
      "tahun_ukp": controllerTahunUkp.text,
      "ruangan": controllerRuangan.text,
      "penguji": controllerPenguji.text,
      "jdwl_ujian": controllerJadwalUji.text,
      "status_ujian": controllerStatusUji.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Penjadwalan Ujian"),),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
              children: [
                new Column(
                  children: <Widget>[
                    Form(
                      key: _formState,
                      child: Column(
                        children: <Widget>[
                          new TextFormField(
                            controller: controllerTahunUkp,
                            decoration: new InputDecoration(
                              hintText: "2021",
                              labelText: "Tahun",
                            ),
                            onSaved:(String value) {
                              this.uk.tahun_ukp = value;
                            },
                          ),
                          new TextFormField(
                            controller: controllerRuangan,
                            decoration: new InputDecoration(
                              hintText: " ",
                              labelText: "Ruangan",
                            ),
                            onSaved:(String value) {
                              this.uk.ruangan = value;
                            },
                          ),
                          new TextFormField(
                            controller: controllerPenguji,
                            decoration: new InputDecoration(
                              hintText: "Penguji",
                              labelText: "Penguji",
                            ),
                            onSaved:(String value) {
                              this.uk.penguji = value;
                            },
                          ),

                          new TextFormField(
                            controller: controllerJadwalUji,
                            decoration: new InputDecoration(
                              hintText: "DD/MM/YYYY",
                              labelText: "Jadwal Ujian",
                            ),
                            onSaved:(String value) {
                              this.uk.jdwl_ujian = value;
                            },
                          ),
                          new TextFormField(
                            controller: controllerStatusUji,
                            decoration: new InputDecoration(
                              hintText: "Diverifikasi,Belum Diverifikasi",
                              labelText: "Status Ujian",
                            ),
                            onSaved:(String value) {
                              this.uk.status_ujian = value;
                            },
                          ),
                          new Padding(padding: const EdgeInsets.all(10.0)),

                          new RaisedButton(
                            child: new Text("TAMBAH"),
                            color: Colors.blueAccent,
                            onPressed: () async {
                              _formState.currentState.save();
                              //ApiServices().createSkkp(this.sk);
                              addJad();
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    )],
                ),
              ]),
        )
    );
  }
}
